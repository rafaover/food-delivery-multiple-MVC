class Router
  def initialize(meals_controller, customer_controller, session_controller, orders_controller, employee_controller)
    @meals_controller = meals_controller
    @customer_controller = customer_controller
    @session_controller = session_controller
    @orders_controller = orders_controller
    @employee_controller = employee_controller
    @running = true
    @user = " "
  end

  # rubocop:disable Metrics/MethodLength
  def run
    system("clear")
    puts "-- Delivery --"
    route_action_constructor
  end

  def route_action_constructor
    @user = @session_controller.login
    case @user.role
    when "manager"
      show_actions_manager while @running
    when "rider"
      show_actions_rider while @running
    end
  end

  def show_actions_manager
    display_tasks_manager
    action = gets.chomp.to_i
    print `clear`
    route_action_manager(action)
  end

  def show_actions_rider
    display_tasks_rider
    action = gets.chomp.to_i
    print `clear`
    route_action_rider(action)
  end

  private

  def route_action_manager(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.edit
    when 4 then @meals_controller.delete
    when 5 then @customer_controller.list
    when 6 then @customer_controller.add
    when 7 then @customer_controller.edit
    when 8 then @customer_controller.delete
    when 9 then @employee_controller.add
    when 10 then @employee_controller.list
    when 11 then @orders_controller.add
    when 12 then @orders_controller.list_undelivered_orders
    when 13 then logout!
    when 14 then stop
    else
      puts "Please choose an option from 1 to 14."
    end
  end

  def route_action_rider(action)
    case action
    when 1 then @orders_controller.mark_as_delivered(@user)
    when 2 then @orders_controller.list_my_orders(@user)
    when 3 then logout!
    when 4 then stop
    else
      puts "Please choose an option from 1 to 4."
    end
  end

  def stop
    @running = false
  end

  def logout!
    run
  end

  def display_tasks_manager
    puts ""
    puts "What do you want to do?"
    puts "1 - List all Meals 🧾"
    puts "2 - Add a new Meal 🥗"
    puts "3 - Edit a Meal"
    puts "4 - Remove a Meal"
    puts "5 - List all customers 🧾"
    puts "6 - Add a new customer 😀"
    puts "7 - Edit a customer Info"
    puts "8 - Remove a customer"
    puts "9 - Add an employee"
    puts "10 - List all employees"
    puts "11 - Add an order"
    puts "12 - List undelivered orders"
    puts "13 - LOGOUT"
    puts "14 - Exit the program ✌"
  end

  def display_tasks_rider
    puts ""
    puts "What do you want to do?"
    puts "1 - Mark as delivered"
    puts "2 - List all my undelivered orders"
    puts "3 - LOGOUT"
    puts "4 - Exit the program ✌"
  end
end
# rubocop:enable Metrics/MethodLength
