class MemberCategory < ActiveRecord::Base

  has_and_belongs_to_many :members

  attr_accessible :description, :name

  validates :name, :presence => true, :uniqueness => true
end
