class RemoveGmapsFromAddresses < ActiveRecord::Migration
  def up
    remove_column :member_addresses, :gmaps
  end

  def down
  end
end
