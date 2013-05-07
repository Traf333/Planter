class PlantPrice < ActiveRecord::Base
  belongs_to :member
  belongs_to :plant
  has_and_belongs_to_many :member_prices
  accepts_nested_attributes_for :member_prices

  attr_accessible :count, :note, :packing, :price, :size, :member_id, :plant_id
  attr_accessible :member_price_ids

end
