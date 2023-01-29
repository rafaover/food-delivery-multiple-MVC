require_relative "../models/order"
require_relative "base_view"

class OrderView < BaseView
  def display_list(orders)
    orders.each do |order|
      puts "Order: #{order.meal.name} - Rider: #{order.employee.username} - Customer: #{order.customer.name}\n"
    end
  end

  def display_list_with_id(orders)
    orders.each do |order|
      puts "ID:#{order.id} - Order: #{order.meal.name} Rider: #{order.employee.username} - Customer: #{order.customer.name}\n"
    end
  end

  def display_riders(riders)
    riders.each do |rider|
      puts "Rider ID:#{rider.id} - Username:#{rider.username}"
    end
  end
end
