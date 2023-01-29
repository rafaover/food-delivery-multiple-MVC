require_relative "../repositories/customer_repository"
require_relative "../models/customer"
require_relative "../views/customer_view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomerView.new
  end

  def add
    name = @view.input_string("Name")
    address = @view.input_string("Address")
    customer = Customer.new(name: name, address: address)
    return @customer_repository.create(customer)
  end

  def edit
    list
    id = @view.input_integer("ID")
    section = @view.input_string("Info to change?\n> Name or Address")
    new_info = @view.input_string("New information")
    @customer_repository.edit_customer_repo(id, section, new_info)
  end

  def delete
    list
    id = @view.input_integer("ID")
    return @customer_repository.delete_repo(id)
  end

  def list
    customers = @customer_repository.all
    return @view.display_list(customers)
  end
end
