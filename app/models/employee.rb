class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def manager?
    @role == "manager"
  end

  def rider?
    @role == "rider"
  end

  def self.headers
    return ["id", "username", "password", "role"]
  end

  def csv_data
    return [@id, @username, @password, @role]
  end
end
