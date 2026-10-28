def process_number(number, &block)
  if block
    block.call(number)
  else
    "Блок не передано"
  end
end

result1 = process_number(5) { |number| number * 2 }
result2 = process_number(5) { |number| number ** 2 }
result3 = process_number(5)

puts "Подвоєння: #{result1}"
puts "Квадрат: #{result2}"
puts "Без блоку: #{result3}"