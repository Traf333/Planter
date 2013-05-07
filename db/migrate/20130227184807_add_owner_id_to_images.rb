class AddOwnerIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :owner_id, :integer
  end
end
