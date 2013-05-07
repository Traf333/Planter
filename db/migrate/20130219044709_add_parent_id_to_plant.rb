class AddParentIdToPlant < ActiveRecord::Migration
  def change
    change_table :plants do |t|
      t.references :plant
    end
    add_index :plants, :plant_id
  end
end
