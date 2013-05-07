class MemberAddressType < ActiveRecord::Base
  has_many :member_addresses
  attr_accessible :name, :description
end
