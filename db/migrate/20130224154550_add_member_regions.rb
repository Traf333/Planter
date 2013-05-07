class AddMemberRegions < ActiveRecord::Migration
  def up
    create_table :members_regions, :id => false, :force => true do |t|
      t.integer :region_id
      t.integer :member_id
    end
  end

  def down
  end
end
