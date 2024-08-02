class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :check_login_time, :set_locale
  helper_method :current_user, :signed?
  add_flash_types :success, :error

  def authenticate!
    redirect_to login_path unless signed?
  end

  def signed?
    current_user.present? && (current_user.last_login_at > 1.hour.ago)
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_login_time
    session.delete(:user_id) unless signed?
  end

  def set_locale
    I18n.locale = extract_locale_from_accept_language_header
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
