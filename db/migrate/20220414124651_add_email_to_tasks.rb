class AddEmailToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :email, :string
  end
end
