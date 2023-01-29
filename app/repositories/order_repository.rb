require "csv"
require_relative "base_repository"
require_relative "../models/order"

class OrderRepository < BaseRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    super(csv_file)
  end

  def construct_model(row)
    row[:meal] = @meal_repository.find(row[:meal_id].to_i)
    row[:employee] = @employee_repository.find(row[:employee_id].to_i)
    row[:customer] = @customer_repository.find(row[:customer_id].to_i)
    row[:id] = row[:id].to_i
    row[:delivered] = row[:delivered] == "true"
    Order.new(row)
  end

  def undelivered_orders
    return @elements.select { |order| order.delivered == false }
  end

  def orders_list_employee(employee)
    return undelivered_orders.select { |order| order.employee == employee }
  end

  def save_csv
    return if @elements.empty?

    CSV.open(@csv_file, "wb") do |csv|
      csv << ["id", "delivered", "meal_id", "customer_id", "employee_id"]
      @elements.each do |order|
        csv << [order.id, order.delivered, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end
end
