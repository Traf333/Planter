class MemberPrice < ActiveRecord::Base

  belongs_to :member
  has_and_belongs_to_many :plant_prices
  accepts_nested_attributes_for :plant_prices

  attr_accessible :member_id, :name
  attr_accessible :plant_price_ids

  validates :name, :presence => true

end
