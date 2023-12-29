class SessionsController < ApplicationController
  def new
    render layout: 'without_header'
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to tasks_path
    else
      flash[:error] = 'Invalid email/password combination'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
