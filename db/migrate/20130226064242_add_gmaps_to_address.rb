class AddGmapsToAddress < ActiveRecord::Migration
  def change
    add_column :member_addresses, :gmaps, :boolean
  end
end
