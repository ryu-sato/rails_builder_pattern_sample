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

        user = User.find_by(username: params_auth_hash[:username])
        if user&.valid_password?(params_auth_hash[:password])
          success!(user)
        else
          fail(:not_found_in_database)
        end
      end
    end
  end
end

Warden::Strategies.add(:custom_database_authenticatable, Devise::Strategies::CustomDatabaseAuthenticatable)
