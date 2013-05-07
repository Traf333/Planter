class AddDefaultValueForUserRole < ActiveRecord::Migration
  def up
    # Setup default role_id for user to 2 (user role)
    remove_column :users, :role_id
    add_column :users, :role_id, :integer, :default => 2
  end

  def down
  end
end
