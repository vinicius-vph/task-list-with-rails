class TasksController < ApplicationController
  before_action :authenticate!, only: %i[new update destory]
  before_action :set_todo!, only: %i[edit update destroy]

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    current_user.tasks.create(task_params)

    redirect_to tasks_path
  end

  def edit; end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:description, :status)
  end

  def set_todo!
    @task = Task.find(params[:id])
  end
end
