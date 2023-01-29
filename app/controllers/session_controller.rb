require_relative "../views/session_view"

class SessionController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionView.new
  end

  def login
    username = @view.input_string("username")
    password = @view.input_password
    employee = @employee_repository.find_by_username(username)
    decoded_password = @view.decode_password(employee.password)

    if employee && decoded_password == password
      @view.welcome(username)
      return employee
    else
      @view.wrong_info
    end
  end
end
