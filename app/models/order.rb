class Order
  attr_accessor :id
  attr_reader :meal, :employee, :customer, :delivered

  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @customer = attributes[:customer]
    @delivered = attributes[:delivered] || false
  end

  def deliver!
    return @delivered = true
  end

  def delivered?
    return @delivered
  end
end
