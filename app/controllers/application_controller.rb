class ApplicationController < ActionController::Base
  def authenticate!
    redirect_to new_session_path unless signed_in?

    # http_basic_authenticate_with name: Rails.application.credentials.authenticate[:name],
    #                              password: Rails.application.credentials.authenticate[:password],
    #                              only: %i[destroy]
  end

  def signed_in?
    current_user.signed_in?
  end

  def sign_in_as(email)
    session[:current_email] = email
  end

  def current_user
    User.new(session[:current_email])
  end
end
