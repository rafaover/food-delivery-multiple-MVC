require_relative "../models/employee"
require_relative "base_view"

class EmployeeView < BaseView
  def display_list(employees)
    employees.each do |employee|
      puts "#{employee.id} - Username: #{employee.username.capitalize}\nRole: #{employee.role}\n"
    end
  end
end
