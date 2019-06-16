# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    return super if sign_in_params["username"] != 'root'

    # admin のみ定期パスワード変更の超簡易実装
    input_year_and_month = params[:user][:password].slice!(-4..-1)
    correct_year_and_month = Time.zone.today.strftime('%y%m')
    if input_year_and_month == correct_year_and_month
      super
    else
      return_path = request.referer.presence || root_path
      redirect_to return_path
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
