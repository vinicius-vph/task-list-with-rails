class SessionsController < ApplicationController
  def new
    render layout: 'without_header'
  end

  def create
    sign_in_as session_params
    redirect_to tasks_path
  end

  def destroy
    session[:current_email] = nil
    redirect_to root_path
  end

  def register
    render layout: 'without_header'
  end

  private

  def session_params
    # params.require(:session).permit(:name, :email, :password)
    params.require(:session).permit(:email, :password)
  end
end
