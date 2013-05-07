#encoding: UTF-8
module PlantsHelper

  def plant_value_or_na(value)

    return 'н/а' if value.blank?
    value

  end

end
