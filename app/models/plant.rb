#encoding: UTF-8
class Plant < ActiveRecord::Base

  belongs_to :plant
  belongs_to :genu
  belongs_to :plant_category
  has_many :images, :foreign_key => :owner_id, :dependent => :destroy
  has_many :plant_prices, :dependent => :destroy

  scope :moderated, lambda { where(:enabled => true) }
  scope :only_parents, lambda { where(:plant_id => nil) }

  attr_accessible :description, :description_short, :application, :height, :lat_name, :name, :width, :plant_id,
                  :crown, :leaves, :flowers, :genu_id, :plant_category_id
  attr_accessible :synonyms, :lat_synonyms
  attr_accessible :enabled

  validates :name, :lat_name, :presence => true, :uniqueness => true

  def title
    "#{self.lat_name} (#{self.name})"
  end

end
