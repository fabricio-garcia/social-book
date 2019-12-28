class DeleteExtraColumnsInUsersTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :name
    remove_column :users, :image
    remove_column :users, :post_id
  end
end
