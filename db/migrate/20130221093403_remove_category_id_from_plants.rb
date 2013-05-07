class RemoveCategoryIdFromPlants < ActiveRecord::Migration
  def up
    remove_column :plants, :plant_category_id
  end

  def down
  end
end
