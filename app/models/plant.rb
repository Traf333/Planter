#encoding: UTF-8
class Plant < ActiveRecord::Base

  belongs_to :plant
  belongs_to :genu
  belongs_to :plant_category
  has_many :images, :foreign_key => :owner_id, :dependent => :destroy
  has_many :plant_prices, :dependent => :destroy

  scope :moderated, lambda { where(:is_shown_in_catalog => true) }
  scope :only_parents, lambda { where(:plant_id => nil) }

  attr_accessible :description, :height, :lat_name, :name, :width, :plant_id,
                  :krone, :leafs, :flowers, :genu_id, :plant_category_id
  attr_accessible :synonyms, :lat_synonyms
  attr_accessible :is_shown_in_catalog

  validates :name, :lat_name, :presence => true, :uniqueness => true

  def title
    "#{self.lat_name} (#{self.name})"
  end

end
