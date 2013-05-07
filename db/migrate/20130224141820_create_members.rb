class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :user
      t.references :country
      t.string :name
      t.boolean :is_moderated, :default => false
      t.string :site
      t.string :phone
      t.string :email
      t.string :description
      t.references :image
      t.string :contacts

      t.timestamps
    end
    add_index :members, :user_id
    add_index :members, :country_id
    add_index :members, :image_id
  end
end
