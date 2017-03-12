class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.boolean :active

      t.timestamps null: false
    end
  end
end
