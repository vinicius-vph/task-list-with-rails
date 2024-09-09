module HasDefaultBoards
  extend ActiveSupport::Concern

  included do
    after_create :set_default_boards
  end

  private

  def set_default_boards
    Board.insert_all(Board.default_settings('boards').map { |board| board.merge(user_id: self.id) })
  end
end
