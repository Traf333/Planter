class AddedParentToPlantCategory < ActiveRecord::Migration
  def up

    change_table :plant_categories do |t|
      t.references :plant_category
    end
    add_index :plant_categories, :plant_category_id

  end

  def down
  end
end
