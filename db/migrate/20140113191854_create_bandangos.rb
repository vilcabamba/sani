class CreateBandangos < ActiveRecord::Migration
  def change
    create_table :bandangos do |t|
      t.references :business, null: false
      t.string     :name
      t.string     :token,    null: false

      t.timestamps
    end
    add_index :bandangos, :business_id
    add_index :bandangos, :token, unique: true
  end
end
