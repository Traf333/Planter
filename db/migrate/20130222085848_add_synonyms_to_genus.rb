class AddSynonymsToGenus < ActiveRecord::Migration
  def change
    add_column :genus, :synonyms, :string
    add_column :genus, :lat_synonyms, :string
  end
end
