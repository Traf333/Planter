class AddGenuToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :genu_id, :integer
  end
end
