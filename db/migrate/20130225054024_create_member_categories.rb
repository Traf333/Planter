class CreateMemberCategories < ActiveRecord::Migration
  def change
    create_table :member_categories do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
