require "csv"
require_relative "../models/customer"
require_relative "base_repository"

class CustomerRepository < BaseRepository
  def edit_customer_repo(id, section, new_info)
    customer = find(id)
    case section
    when "name"
      customer.name = new_info
    when "address"
      customer.address = new_info
    end
    save_csv
  end

  def construct_model(row)
    row[:id] = row[:id].to_i
    Customer.new(row)
  end
end
