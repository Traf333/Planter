class RenameTableToPlants < ActiveRecord::Migration
  def up
    change_table :plants do |t|
      t.rename :krone, :crown
      t.rename :leafs, :leaves
      t.rename :is_shown_in_catalog, :enabled
      t.string :application
      t.text :description_short
    end
  end

  def down
    change_table :plants do |t|
      t.rename :crown, :krone
      t.rename :leaves, :leafs
      t.rename :enabled, :is_shown_in_catalog
      t.remove :application
      t.remove :description_short
    end
  end
end
