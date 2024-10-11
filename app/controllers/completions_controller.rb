class CompletionsController < ApplicationController
  before_action :authenticate!

  def create
    task.completed!
    redirect_to board_context_path(board_id: task.board.try(:id), id: task.context.try(:id))
  end

  def destroy
    task.incompleted!
    redirect_to board_context_path(board_id: task.board.try(:id), id: task.context.try(:id))
  end

  private

  def task
    # current_user.tasks.find(params[:task_id])
    Task.find(params[:task_id])
  end
end
