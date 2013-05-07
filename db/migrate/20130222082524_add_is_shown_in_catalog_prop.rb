class AddIsShownInCatalogProp < ActiveRecord::Migration
  def up
    add_column :plants, :is_shown_in_catalog, :boolean, :default => true
  end

  def down
  end
end
