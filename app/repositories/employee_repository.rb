require "csv"
require_relative "../models/employee"
require_relative "base_repository"

class EmployeeRepository < BaseRepository
  def all_riders
    return @elements.select { |employee| employee.rider? }
  end

  def find_by_username(username)
    return @elements.find { |employee| employee.username == username }
  end

  def construct_model(row)
    row[:id] = row[:id].to_i
    Employee.new(row)
  end
end
