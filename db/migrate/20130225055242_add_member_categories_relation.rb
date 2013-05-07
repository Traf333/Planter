class AddMemberCategoriesRelation < ActiveRecord::Migration
  def up
    create_table :member_categories_members, :id => false, :force => true do |t|
      t.integer :region_id
      t.integer :member_id
    end
  end

  def down
  end
end
