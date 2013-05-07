class Genu < ActiveRecord::Base
  belongs_to :plant_category
  has_many :plants
  attr_accessible :description, :lat_name, :name, :plant_category_id
  attr_accessible :synonyms, :lat_synonyms

  validates :name, :lat_name, :presence => true, :uniqueness => true
  validates :plant_category_id, :presence => true

  def title
    "#{self.lat_name} (#{self.name})"
  end

end
