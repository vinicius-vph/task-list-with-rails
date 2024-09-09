class TasksController < ApplicationController
  before_action :authenticate!
  before_action :set_todo!, only: %i[edit update show destroy]

  def index
    @tasks = current_user.tasks if current_user
  end

  def new
    @resource = Task.new
  end

  def create
    @resource = Task.new(task_params)

    if @resource.save
      redirect_to board_context_path(board_id: @resource.board.id,id: @resource.context.id), success: t('flash.created', model: Task.model_name.human)
    else
      flash.now[:error] = t('flash.error', errors: @resource.errors.full_messages.join(', '))
      render 'new'
    end
  end

  def edit; end

  def update
    @task.update(task_params)
    redirect_to board_context_task_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:description, :context_id)
  end

  def set_todo!
    @task = Task.find(params[:id])
  end
end
