class BoardsController < ApplicationController
  before_action :authenticate!

  def index
    @boards = current_user ? current_user.boards : Board.default_boards
  end

  def new
    @boards = Board.new
  end

  def create
    @boards = Board.new(board_params.merge(user_id: current_user.id))

    if @boards.save
      flash[:success] = t('boards.create.success')
      redirect_to boards_path
    else
      flash.now[:error] = t('boards.create.error', errors: @boards.errors.full_messages.join(', '))
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
