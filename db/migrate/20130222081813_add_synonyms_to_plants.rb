class AddSynonymsToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :synonyms, :string
    add_column :plants, :lat_synonyms, :string
  end
end
