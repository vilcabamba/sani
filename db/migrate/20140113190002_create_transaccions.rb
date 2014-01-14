class CreateTransaccions < ActiveRecord::Migration
  def change
    create_table :transacciones do |t|
      t.references :bandango, null: false

      t.string :model, null: false
      t.string :action, null: false
      t.text   :attrs
      t.timestamps
    end
    add_index :transacciones, :bandango_id
  end
end
