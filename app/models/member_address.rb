class MemberAddress < ActiveRecord::Base

  belongs_to :member
  belongs_to :member_address_type
  attr_accessible :address, :contacts, :description, :latitude, :longitude, :note, :member_address_type_id

  validates :address, :presence => true

end
