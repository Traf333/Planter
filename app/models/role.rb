class Role < ActiveRecord::Base
  attr_accessible :name, :title, :description, :the_role

  # Member seller role id.
  SELLER_ID = 3

end
