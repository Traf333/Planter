class CreatePlantCategories < ActiveRecord::Migration
  def change
    create_table :plant_categories do |t|
      t.string :name
      t.string :lat_name
      t.text :description

      t.timestamps
    end
  end
end
