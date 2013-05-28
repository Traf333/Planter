class ChangeTableToCategories < ActiveRecord::Migration
  def up
    change_table :plant_categories do |t|
      t.rename :plant_category_id, :parent_category_id
    end
  end

  def down
    change_table :plant_categories do |t|
      t.rename :parent_category_id, :plant_category_id
    end
  end
end
