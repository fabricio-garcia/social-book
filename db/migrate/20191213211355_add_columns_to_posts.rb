class AddColumnsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :content, :text
    add_reference :posts, :user, foreign_key: true
  end
end
