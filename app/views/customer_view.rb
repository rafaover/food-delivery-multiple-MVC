require_relative "../models/customer"
require_relative "base_view"

class CustomerView < BaseView
  def display_list(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} >> Lives in #{customer.address}"
    end
  end
end
