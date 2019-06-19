# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  rescue_from Net::LDAP::ConnectionRefusedError, with: :handle_401
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   self.resource = warden.authenticate!(auth_options)
  #   set_flash_message!(:notice, :signed_in)
  #   sign_in(resource_name, resource)
  #   yield resource if block_given?
  #   respond_with resource, location: after_sign_in_path_for(resource)
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def handle_401(exception = nil)
    logger.info "Rendering 401 with exception: #{exception.message}" if exception

    set_flash_message!(:notice, :not_found_in_database)
    redirect_to new_user_session_path
  end
end
