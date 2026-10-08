numbers = [3, 7, 12, 0]

result1 = numbers.all? { |number| number > 0 }

positive_numbers = numbers.select { |number| number > 0 }
result2 = positive_numbers.size == numbers.size

puts "Спосіб 1: #{result1}"
puts "Спосіб 2: #{result2}"