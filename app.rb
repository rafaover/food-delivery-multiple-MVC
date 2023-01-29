# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative './app/repositories/meal_repository'
require_relative './app/repositories/customer_repository'
require_relative './app/repositories/employee_repository'
require_relative './app/repositories/order_repository'
require_relative './app/repositories/employee_repository'

require_relative './app/controllers/customers_controller'
require_relative './app/controllers/meals_controller'
require_relative './app/controllers/session_controller'
require_relative './app/controllers/orders_controller'
require_relative './app/controllers/employee_controller'

require_relative 'router'

csv_meals = File.join(__dir__, './data/meals.csv')
csv_customers = File.join(__dir__, './data/customers.csv')
csv_employees = File.join(__dir__, './data/employees.csv')
csv_orders = File.join(__dir__, './data/orders.csv')

meal_repo = MealRepository.new(csv_meals)
customer_repo = CustomerRepository.new(csv_customers)
employees_repo = EmployeeRepository.new(csv_employees)
orders_repo = OrderRepository.new(csv_orders, meal_repo, customer_repo, employees_repo)

meals_controller = MealsController.new(meal_repo)
customer_controller = CustomersController.new(customer_repo)
session_controller = SessionController.new(employees_repo)
employee_controller = EmployeeController.new(employees_repo)
orders_controller = OrdersController.new(meal_repo, customer_repo, employees_repo, orders_repo)

router = Router.new(
  meals_controller,
  customer_controller,
  session_controller,
  orders_controller,
  employee_controller
)

router.run
