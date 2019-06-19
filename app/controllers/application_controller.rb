class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  rescue_from CanCan::AccessDenied, with: :handle_403

  before_action :authenticate_user!

  private

  def handle_500(exception = nil)
    logger.info "Rendering 500 with exception: #{exception.message}" if exception
  end

  def handle_403(exception = nil)
    logger.info "Rendering 403 with exception: #{exception.message}" if exception

    respond_to do |format|
      format.json { head :forbidden, status: 403, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, status: 403, notice: exception.message }
      format.js   { head :forbidden, status: 403, content_type: 'text/html' }
    end
  end
end
