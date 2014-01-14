class AddTimeToTransaccion < ActiveRecord::Migration
  def change
    add_column :transacciones, :time, :datetime, null: false
    add_index  :transacciones, :time
  end
end
