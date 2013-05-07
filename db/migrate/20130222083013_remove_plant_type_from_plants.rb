class RemovePlantTypeFromPlants < ActiveRecord::Migration
  def up
    remove_column :plants, :plant_type
  end

  def down
  end
end
