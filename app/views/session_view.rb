require 'io/console'
require_relative "base_view"
require "base64"

class SessionView < BaseView
  def welcome(username)
    return puts "Welcome #{username}"
  end

  def wrong_info
    return puts "Wrong information. Try again."
  end

  def input_password
    puts ""
    return IO.console.getpass("Enter Password: ")
  end

  def decode_password(password)
    return Base64.decode64(password)
  end

  def create_password
    pwd_first = IO.console.getpass("Enter Password: ")
    pwd_second = IO.console.getpass("Enter Password again: ")
    if pwd_first == pwd_second
      return Base64.encode64(pwd_second)
    else
      puts "You need type the same password"
    end
  end
end
