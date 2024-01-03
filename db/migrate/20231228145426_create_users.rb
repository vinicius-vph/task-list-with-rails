class CreateUsers < ActiveRecord::Migration[7.1]
  def up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :active, default: 1
      t.datetime :last_login_at
      t.string :password_reset_token
      t.datetime :password_reset_sent_at

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
