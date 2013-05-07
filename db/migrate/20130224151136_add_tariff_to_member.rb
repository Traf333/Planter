class AddTariffToMember < ActiveRecord::Migration
  def change
    add_column :members, :member_tariff_id, :integer
  end
end
