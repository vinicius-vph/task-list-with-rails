class Task < ApplicationRecord
  belongs_to :context
  has_one :board, through: :context
  has_one :user, through: :board

  def completed?
    completed_at?
  end

  def completed!
    touch :completed_at
  end

  def incompleted!
    update_column :completed_at, nil
  end
end
