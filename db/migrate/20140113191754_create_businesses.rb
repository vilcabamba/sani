class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :nombre, null: false
      t.string :token,  null: false
      t.timestamps
    end
    add_index :businesses, :nombre, unique: true
    add_index :businesses, :token, unique: true
  end
end
