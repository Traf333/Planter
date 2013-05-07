#encoding: UTF-8
module PlantCategoriesHelper

  CATEGORIES_SPLIT_CHAR = ' - '

  def categories_list

    def make(list, hash, level)
      hash.each do |c|

        name = c[:name]
        level.times { name = CATEGORIES_SPLIT_CHAR + name }
        list << [name, c[:id]]

        make(list, c[:children], level + 1)
      end
    end

    list = []
    make(list, PlantCategory.make_categories_tree_hash, 0)
    list

  end

end
