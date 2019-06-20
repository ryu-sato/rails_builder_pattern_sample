class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  rescue_from CanCan::AccessDenied, with: :handle_403
  rescue_from Net::LDAP::ConnectionRefusedError, with: :handle_401

  before_action :authenticate_user!

  # リソースへの権限が無かった場合はログインページへリダイレクトする
  def access_denied(exception)
    handle_403(exception)
  end

  private

  def handle_500(exception = nil)
    logger.info "Rendering 500 with exception: #{exception.message}" if exception
  end

  def handle_401(exception = nil)
    logger.info "Rendering 401 with exception: #{exception.message}" if exception

    set_flash_message!(:notice, :not_found_in_database)
    redirect_to new_user_session_path
  end

  def handle_403(exception = nil)
    logger.info "Rendering 403 with exception: #{exception.message}" if exception

    respond_to do |format|
      format.json { head :forbidden, status: 403, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, status: 403, content_type: 'text/html' }
    end
  end
end
