class BaseView
  def input_string(info)
    puts ""
    puts "#{info}?\n"
    return gets.chomp
  end

  def input_integer(info)
    puts ""
    puts "#{info}?\n"
    return gets.chomp.to_i
  end

  def input_index(info)
    puts ""
    puts "#{info}?\n"
    return gets.chomp.to_i - 1
  end
end
