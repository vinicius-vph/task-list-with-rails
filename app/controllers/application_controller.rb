class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def authenticate!
    redirect_to register_path unless signed_in?
  end

  def signed_in?
    return false if current_user.nil?

    current_user.signed_in?
  end

  def sign_in_as(params)
    session[:current_email] = params[:email]
    # session[:current_user] = params[:name]
    session[:current_user] = "Vinicius"
  end

  private

  def current_user
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    return unless session[:current_email].present?

    @current_user ||= User.new(session[:current_user],
                               session[:current_email])
  end
end
