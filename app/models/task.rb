class Task < ApplicationRecord
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
