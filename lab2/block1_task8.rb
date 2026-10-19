numbers = [3, 2, -4, 5, 6]

#1
product1 = 1
count = 0
i = 0

while i < numbers.length
  if numbers[i].even?
    product1 = product1 * numbers[i]
    count = count + 1
  end

  i = i + 1
end

#2
even_numbers = numbers.select { |number| number.even? }
product2 = even_numbers.reduce(1) { |product, number| product * number }

puts "Масив: #{numbers.inspect}"

if count == 0
  puts "Парних чисел немає."
else
  puts "Спосіб 1: #{product1}"
  puts "Спосіб 2: #{product2}"
  puts "Результати однакові: #{product1 == product2}"
end