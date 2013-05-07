class CreateMemberAddresses < ActiveRecord::Migration
  def change
    create_table :member_addresses do |t|
      t.string :address
      t.string :note
      t.string :contacts
      t.float :langitude
      t.float :longitude
      t.string :description
      t.references :member

      t.timestamps
    end
    add_index :member_addresses, :member_id
  end
end
