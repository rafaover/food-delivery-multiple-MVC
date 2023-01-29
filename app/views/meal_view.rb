require_relative "../models/meal"
require_relative "base_view"

class MealsView < BaseView
  def display_list(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name.capitalize}\nCost: AU$ #{meal.price}\n"
    end
  end
end
