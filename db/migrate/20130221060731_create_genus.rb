class CreateGenus < ActiveRecord::Migration
  def change
    create_table :genus do |t|
      t.string :name
      t.string :lat_name
      t.string :description
      t.references :plant_category

      t.timestamps
    end
    add_index :genus, :plant_category_id
  end
end
