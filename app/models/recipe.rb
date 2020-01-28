class Recipe < ApplicationRecord
  belongs_to :user
  
  def ingredients_list
    self.ingredients.split(", ")
  end

  def directions_list
    directions.split(", ")
  end

  def friendly_created_at
    created_at.strftime("%b %d, %Y")
  end

  def friendly_prep_time
    prep_time
    hours = prep_time/60
    minutes = prep_time % 60
    time_message = ""

    time_message += "#{hours} #{"Hour".pluralize(hours)}" if hours > 0
    time_message += ", " if hours > 0 && minutes > 0
    time_message += "#{minutes} #{"Minutes".pluralize(minutes)}" if minutes > 0

    time_message
  end
end
