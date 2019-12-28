class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :friend, null: false, foreign_key: { to_table: :users }, index: true
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
