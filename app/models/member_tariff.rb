class MemberTariff < ActiveRecord::Base
  has_many :members
  attr_accessible :name, :description
  validates :name, :presence => true, :uniqueness => true
end
