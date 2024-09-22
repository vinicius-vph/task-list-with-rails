class TasksController < ApplicationController
  before_action :authenticate!
  before_action :set_task!, only: %i[create edit update show destroy]

  def index
    @tasks = current_user ? current_user.try(:tasks) : []
  end

  def new
    @task = Task.new
  end

  def create
    if @task.save
      flash[:success] = t('tasks.create.success')
      redirect_to board_context_task_path(board_id: @board.try(:id), context_id: @context.try(:id), id: @task.try(:id))
    else
      flash.now[:error] = t('tasks.create.error', errors: @task.errors.full_messages.join(', '))
      render 'new'
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      flash[:success] = t('tasks.update.success')
      redirect_to board_context_task_path(board_id: @board.try(:id), context_id: @context.try(:id), id: @task.try(:id))
    else
      flash.now[:error] = t('tasks.update.error', errors: @task.errors.full_messages.join(', '))
      render 'edit'
    end
  end

  def destroy
    if @task.destroy
      flash[:success] = t('tasks.destroy.success')
      redirect_to board_context_path(board_id: @board.try(:id), id: @context.try(:id))
    else
      flash.now[:error] = t('tasks.destroy.error', errors: @task.errors.full_messages.join(', '))
      redirect_to board_context_task_path(board_id: @board.try(:id), id: @context.try(:id), id: @task.try(:id))
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :context_id)
  end

  def set_task!
    @task = params[:action].eql?('create') ? Task.new(task_params) : Task.find_by(id: params[:id])
    @board = Board.find_by(id: params[:board_id])
    @context = Context.find_by(id: params[:context_id])
  end
end
