class SessionsController < ApplicationController
  def new; end

  def create
    sign_in_as params[:session][:email]

    redirect_to new_task_path
  end

  # def destroy
  #   session[:current_email] = nil
  # end
end
