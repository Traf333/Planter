class Region < ActiveRecord::Base
  belongs_to :country
  has_and_belongs_to_many :members

  attr_accessible :name
  attr_accessible :country_id

  validates :name, :presence => true, :uniqueness => true
end
