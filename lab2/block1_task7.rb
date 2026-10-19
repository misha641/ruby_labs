numbers = [-3, 5, 0, -7, 8]

#1
min = numbers[0]
i = 1

while i < numbers.length
  if numbers[i] < min
   min = numbers[i]
end
  i = i + 1
end

result1 = numbers.dup
i = 0

while i < result1.length
  if result1[i] > 0
    result1[i] = min
end
  i = i + 1
end

#2: 
min2 = numbers.min

result2 = numbers.map do |number|
  if number > 0
    min2
  else
    number
  end
end

puts "Початковий масив: #{numbers.inspect}"
puts "Спосіб 1: #{result1.inspect}"
puts "Спосіб 2: #{result2.inspect}"
puts "Результати однакові: #{result1 == result2}"