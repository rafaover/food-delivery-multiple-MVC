require "csv"
require_relative "../models/meal"
require_relative "base_repository"

class MealRepository < BaseRepository
  def edit_meal_repo(id, section, new_info)
    meal = find(id)
    case section
    when "name"
      meal.name = new_info
    when "price"
      meal.price = new_info
    end
    save_csv
  end

  def construct_model(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    Meal.new(row)
  end
end
