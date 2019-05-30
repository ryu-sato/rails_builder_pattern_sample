class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(user)
    base_password = params&.fetch(:user)&.fetch(:password)&.slice(0..-5)
    if base_password.present?
      # 定期パスワード変更の超簡易実装
      year_and_month = Time.zone.today.strftime('%y%m')
      new_password = "#{base_password}#{year_and_month}"
      reset_password_without_logout(user, new_password)
    end

    super
  end

  def reset_password_without_logout(user, new_password)
    user.reset_password(new_password, new_password)
    sign_in(user, bypass: true)
  end
end
