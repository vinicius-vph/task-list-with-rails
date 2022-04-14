class CompletionsController < ApplicationController
  def create
    task.completed!
    redirect_to tasks_path
  end

  def destroy
    p "@@@@@@@@@@@@@@@22"
    p task
    task.incompleted!
    redirect_to tasks_path
  end

  private

  def task
    current_user.tasks.find(params[:task_id])
  end
end
