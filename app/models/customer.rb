class Customer
  attr_accessor :id, :name, :address

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end

  def self.headers
    return ["id", "name", "address"]
  end

  def csv_data
    return [@id, @name, @address]
  end
end
