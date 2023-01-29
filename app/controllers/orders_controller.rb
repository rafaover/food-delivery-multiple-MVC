require_relative "../repositories/order_repository"
require_relative "../models/order"
require_relative "../views/order_view"

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @view = OrderView.new
  end

  # rubocop:disable Metrics/MethodLength
  def add
    MealsController.new(@meal_repository).list
    meal_id = @view.input_integer("Meal ID")
    print `clear`
    meal = @meal_repository.find(meal_id)

    CustomersController.new(@customer_repository).list
    customer_id = @view.input_integer("Customer ID")
    print `clear`
    customer = @customer_repository.find(customer_id)

    @view.display_riders(@employee_repository.all_riders)
    employee_id = @view.input_integer("Employee ID")
    print `clear`
    employee = @employee_repository.find(employee_id)

    new_order = Order.new(meal: meal, employee: employee, customer: customer)
    return @order_repository.create(new_order)
  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    return @view.display_list(undelivered_orders)
  end

  def list_my_orders(employee)
    orders = @order_repository.orders_list_employee(employee) # undelivered
    return @view.display_list(orders)
  end

  def mark_as_delivered(employee)
    orders = @order_repository.orders_list_employee(employee)
    @view.display_list_with_id(orders)
    order_id = @view.input_integer("Order ID")
    @order_repository.find(order_id).deliver!
    @order_repository.save_csv
  end
end
# rubocop:enable Metrics/MethodLength
