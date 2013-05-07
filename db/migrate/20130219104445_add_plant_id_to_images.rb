class AddPlantIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :plant_id, :integer
  end
end
