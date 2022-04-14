class SessionsController < ApplicationController
  def new; end

  def create
    sign_in_as params[:session][:email]

    redirect_to new_task_path
  end
end
