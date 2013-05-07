class FixMemberCategoriesRelation < ActiveRecord::Migration
  def up
    remove_column :member_categories_members, :region_id
    add_column :member_categories_members, :member_category_id, :integer
  end

  def down
  end
end
