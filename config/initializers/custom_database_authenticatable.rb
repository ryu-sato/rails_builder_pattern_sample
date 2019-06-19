require 'devise/strategies/database_authenticatable'

module Devise
  module Strategies
    class CustomDatabaseAuthenticatable < DatabaseAuthenticatable
      def valid?
        true
      end

      # ref: https://github.com/cschiewek/devise_ldap_authenticatable/issues/24#issuecomment-965648
      def authenticate!
        return fail(:invalid) unless valid_for_params_auth?

        is_admin = params_auth_hash[:username] == 'admin'
        password = params_auth_hash[:password]

        # admin ユーザはパスワード末尾にYYMMがアクセス日と異なれば認証NGとする
        if is_admin
          input_year_and_month = password.slice!(-4..-1)
          correct_year_and_month = Time.zone.today.strftime('%y%m')
          return fail(:not_found_in_database) if input_year_and_month != correct_year_and_month
        end

        # 内部で認証するユーザ一覧に存在すればパスワード認証を行う
        user = User.internals.find_by(username: params_auth_hash[:username])
        if user&.valid_password?(password)
          success!(user)
        else
          fail(:not_found_in_database)
        end
      end
    end
  end
end

Warden::Strategies.add(:custom_database_authenticatable, Devise::Strategies::CustomDatabaseAuthenticatable)
