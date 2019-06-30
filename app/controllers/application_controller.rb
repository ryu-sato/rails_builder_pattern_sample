class ApplicationController < ActionController::Base
  check_authorization unless: :skip_checking_authorzation?

  rescue_from Exception, with: :handle_500
  rescue_from CanCan::AccessDenied, with: :handle_403
  rescue_from Net::LDAP::ConnectionRefusedError, with: :handle_401

  before_action :set_paper_trail_whodunnit
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

  def skip_checking_authorzation?
    # devise による login/logout セッション操作はログイン前のため check_authorization は skip する
    # ActiveAdmin は内部で権限管理が働くので、check_authorization は skip する
    devise_controller? || activeadmin_controller?
  end

  def activeadmin_controller?
    self.class.ancestors.include? ActiveAdmin::BaseController
  end

  def user_for_paper_trail
    User.find(current_user.id).username
  end
end
