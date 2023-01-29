class Meal
  attr_accessor :id, :name, :price

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def self.headers
    return ["id", "name", "price"]
  end

  def csv_data
    return [@id, @name, @price]
  end
end
