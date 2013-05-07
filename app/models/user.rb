class User < ActiveRecord::Base

  has_one :member

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :address, :email, :last_name, :name, :phone, :site, :surname
  attr_accessible :skype, :icq
  attr_accessible :role_id

  def full_name
    "#{last_name} #{name} #{surname}"
  end

  def full_name_with_email
    "#{full_name} #{email}"
  end

  def online?
    updated_at > 10.minutes.ago
  end

  def is_seller
    self.role_id == Role::SELLER_ID
  end

end
