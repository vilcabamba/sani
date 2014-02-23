class AddUserIdToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :user_id, :integer, null: false, default: 1
    add_index :businesses, :user_id
  end
end
