class ChangedWidthAndHeightType < ActiveRecord::Migration
  def up
    change_column :plants, :width, :string, :null => true
    change_column :plants, :height, :string, :null => true
  end

  def down
  end
end
