class ContextsController < ApplicationController
  before_action :authenticate!

  def new
    @context = Context.new
  end

  def create
    @context = Context.new(context_params.merge(board_id: params[:board_id]))

    if @context.save
      redirect_to board_path(params[:board_id]), success: t('flash.created', model: Context.model_name.human)
    else
      flash.now[:error] = t('flash.error')
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
