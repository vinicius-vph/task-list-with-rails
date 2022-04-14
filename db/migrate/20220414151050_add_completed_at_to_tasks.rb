class AddCompletedAtToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :completed_at, :timestamps
  end
end
