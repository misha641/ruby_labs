def sum_array(numbers)
  numbers.sum
end

puts "Сума [2, 4, 6]: #{sum_array([2, 4, 6])}"
puts "Сума [-3, 5, 8]: #{sum_array([-3, 5, 8])}"
puts "Сума порожнього масиву: #{sum_array([])}"

def sum_numbers(*numbers)
  numbers.sum
end

puts "\nОкремі аргументи 2, 4, 6: #{sum_numbers(2, 4, 6)}"
puts "Без аргументів: #{sum_numbers}"

values = [10, 20, 30]
puts "Розпакований масив: #{sum_numbers(*values)}"