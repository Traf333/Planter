class CreatePlantPrices < ActiveRecord::Migration
  def change
    create_table :plant_prices do |t|
      t.string :packing
      t.string :size
      t.string :count
      t.float :price
      t.string :note
      t.integer :member_id
      t.integer :plant_id

      t.timestamps
    end
  end
end
