class PasswordResetsController < ApplicationController
  def new
    render layout: 'without_header', template: 'auth/passwords/new'
  end

  def create
    @user = User.find_by_email(params[:email])
    unless @user.nil?
      @user.send_password_reset
      flash[:success] = 'Email sent with password reset instructions.'
      redirect_to edit_password_reset_path(@user.password_reset_token)
    else
      flash[:error] = 'Email not found'
      redirect_to new_password_reset_path
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
    render layout: 'without_header', template: 'auth/passwords/edit'
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])

    if @user.password_reset_sent_at < 2.hours.ago
      flash[:error] = "Password reset has expired."
      redirect_to new_password_reset_path
    elsif @user.update(user_params)
      flash[:success] =  "Password has been reset!"
      redirect_to root_url
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password)
  end
end
