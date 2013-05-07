class CreatePlantFeatures < ActiveRecord::Migration
  def change
    create_table :plant_features do |t|
      t.string :name

      t.timestamps
    end
  end
end
