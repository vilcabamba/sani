class CreateBandangoConnections < ActiveRecord::Migration
  def change
    create_table :bandango_connections do |t|
      t.references :bandango, null: false
      t.text :transacciones_sent
      t.datetime :created_at
    end
    add_index :bandango_connections, :bandango_id
  end
end
