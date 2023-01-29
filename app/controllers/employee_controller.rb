require_relative "../repositories/employee_repository"
require_relative "../models/employee"
require_relative "../views/base_view"
require_relative "../views/employee_view"
require 'bcrypt'

class EmployeeController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionView.new
    @view_employee = EmployeeView.new
  end

  def add
    username = @view.input_string("username")
    password = @view.create_password
    role = @view.input_string("Your Role? manager or rider?")
    employee = Employee.new(username: username, password: password, role: role)
    return @employee_repository.create(employee)
  end

  def list
    employees = @employee_repository.all
    return @view_employee.display_list(employees)
  end
end
