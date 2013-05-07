class AllowNullForPlantId < ActiveRecord::Migration
  def up
    change_column :plants, :plant_id, :integer, :null => true
  end

  def down
  end
end
