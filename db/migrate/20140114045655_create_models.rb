class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name,          null: false
      t.string :identificator, null: false
      t.timestamps
    end
    add_index :models, :name, unique: true
  end
end
