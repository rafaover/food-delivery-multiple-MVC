require_relative "../repositories/meal_repository"
require_relative "../models/meal"
require_relative "../views/meal_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    name = @view.input_string("Name")
    price = @view.input_integer("Price")
    meal = Meal.new(name: name, price: price)
    return @meal_repository.create(meal)
  end

  def edit
    list
    id = @view.input_integer("ID")
    section = @view.input_string("Info to change?\n> Name or Price")
    case section.downcase
    when "name"
      new_info = @view.input_string("New name?")
    when "price"
      new_info = @view.input_integer("New price?")
    end
    @meal_repository.edit_meal_repo(id, section, new_info)
  end

  def delete
    list
    id = @view.input_integer("ID")
    return @meal_repository.delete_repo(id)
  end

  def list
    meals = @meal_repository.all
    return @view.display_list(meals)
  end
end
