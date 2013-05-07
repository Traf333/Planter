class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  belongs_to :member_tariff
  has_one :image, :foreign_key => :owner_id
  has_and_belongs_to_many :member_categories

  has_and_belongs_to_many :regions
  accepts_nested_attributes_for :regions

  has_many :member_addresses, :dependent => :delete_all
  accepts_nested_attributes_for :member_addresses, :allow_destroy => true

  has_many :member_prices
  accepts_nested_attributes_for :member_prices, :allow_destroy => true

  has_many :plant_prices
  accepts_nested_attributes_for :plant_prices, :allow_destroy => true

  attr_accessible :contacts, :description, :email, :is_moderated, :name, :phone, :site
  attr_accessible :user_id, :country_id, :image_id
  attr_accessible :member_tariff_id

  attr_accessible :region_ids
  attr_accessible :member_category_ids
  attr_accessible :member_addresses_attributes
  attr_accessible :member_addresses
  attr_accessible :prices
  attr_accessible :prices_attributes
  attr_accessible :plant_prices
  attr_accessible :plant_prices_attributes

  validates :name, :presence => true, :uniqueness => true

  scope :moderated, lambda { where(:is_moderated => true) }

end
