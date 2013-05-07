class AddRelationBetweenPlantPriceAndMemberPrice < ActiveRecord::Migration
  def up

    create_table :member_prices_plant_prices, :id => false, :force => true do |t|
      t.integer :member_price_id
      t.integer :plant_price_id
    end

  end

  def down
  end
end
