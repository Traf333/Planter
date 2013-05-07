class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.string :lat_name
      t.string :description
      t.integer :plant_type
      t.float :width
      t.float :height

      t.timestamps
    end
  end
end
