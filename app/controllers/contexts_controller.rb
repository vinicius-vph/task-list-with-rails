class ContextsController < ApplicationController
  before_action :authenticate!

  def new
    @context = Context.new
  end

  def create
    @context = Context.new(context_params.merge(board_id: params[:board_id]))

    if @context.save
      flash[:success] = t('contexts.create.success')
      redirect_to board_path(params[:board_id])
    else
      flash.now[:error] = t('contexts.create.error', errors: @context.errors.full_messages.join(', '))
      render 'new'
    end
  end

  def show
    @context = Context.find_by_id(params[:id])
    @tasks = @context.tasks
  end

  private

  def context_params
    params.require(:context).permit(:name, :description, :priority)
  end
end
