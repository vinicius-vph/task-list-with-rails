class CompletionsController < ApplicationController
  before_action :authenticate!
  
  def create
    task.completed!
    redirect_to tasks_path
  end

  def destroy
    task.incompleted!
    redirect_to tasks_path
  end

  private

  def task
    current_user.tasks.find(params[:task_id])
  end
end
