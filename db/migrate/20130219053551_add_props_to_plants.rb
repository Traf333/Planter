class AddPropsToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :krone, :string
    add_column :plants, :flowers, :string
    add_column :plants, :leafs, :string
  end
end
