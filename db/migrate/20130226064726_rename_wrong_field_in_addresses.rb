class RenameWrongFieldInAddresses < ActiveRecord::Migration
  def up
    rename_column :member_addresses, :langitude, :latitude
  end

  def down
  end
end
