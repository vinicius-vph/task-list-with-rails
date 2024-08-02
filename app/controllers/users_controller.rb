class UsersController < ApplicationController
  def new
    @user = User.new
    render layout: 'without_header'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      @user.update(last_login_at: Time.current)
      redirect_to boards_path
    else
      flash[:error] = @user.errors.full_messages.join(', ')
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end