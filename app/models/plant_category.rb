class PlantCategory < ActiveRecord::Base
  belongs_to :plant_category
  has_many :genus
  has_many :plants

  scope :roots, lambda { where(:parent_category_id => nil ) }
  scope :children, lambda { |id| where(:parent_category_id => id) }

  attr_accessible :description, :lat_name, :name
  attr_accessible :parent_category_id

  validates :name, :lat_name, :presence => true, :uniqueness => true

  def self.make_categories_tree_hash(categories = nil, level = 0)
    categories = PlantCategory.roots if categories.nil?
    categories.map do |c|
      {
        :id => c.id,
        :name => c.name,
        :category_object => c,
        :level_count => level,
        :children => self.make_categories_tree_hash(PlantCategory.children(c.id), level + 1)
      }
    end
  end

end
