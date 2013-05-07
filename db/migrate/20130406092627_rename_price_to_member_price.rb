class RenamePriceToMemberPrice < ActiveRecord::Migration
  def up
    rename_table :prices, :member_prices
  end

  def down
    rename_table :member_prices, :prices
  end
end
