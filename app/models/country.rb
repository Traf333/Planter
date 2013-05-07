class Country < ActiveRecord::Base

  has_many :members

  attr_accessible :name

  validates :name, :presence => true, :uniqueness => true

end
