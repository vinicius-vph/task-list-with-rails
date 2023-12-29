class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  add_flash_types :success, :error

  def authenticate!
    redirect_to login_path unless signed_in?
  end

  def signed_in?
    current_user.present?
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
