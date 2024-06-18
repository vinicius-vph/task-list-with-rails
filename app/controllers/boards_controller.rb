class BoardsController < ApplicationController
  before_action :authenticate!

  def index
    if current_user
      @boards = current_user.boards
    else
      @boards = Board.default_boards
    end
  end

  def new
    @boards = Board.new
  end

  def create
    @boards = Board.new(board_params.merge(user_id: current_user.id))

    if @boards.save
      redirect_to boards_path, success: t('flash.created', model: Board.model_name.human)
    else
      flash.now[:error] = t('flash.error')
      render 'new'
    end
  end

  def show
    @boards = Board.find_by_id(params[:id])
    @contexts = @boards.contexts
  end

  private

  def board_params
    params.require(:board).permit(:name, :description)
  end
end
