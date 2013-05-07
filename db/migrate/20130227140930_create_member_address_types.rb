class CreateMemberAddressTypes < ActiveRecord::Migration
  def change
    create_table :member_address_types do |t|
      t.string :name
      t.string :description
    end
    add_column :member_addresses, :member_address_type_id, :integer
  end
end
