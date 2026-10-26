matrix = [
  [2, 5, 1],
  [7, 3, 4],
  [6, 8, 9]
]

#1
rows = matrix.length
columns = matrix[0].length

maxima1 = []
product1 = 1
potochnyi_stovpets = 0

while column < columns
  maximum = matrix[0][column]
  row = 1

  while row < rows
    if matrix[row][column] > maximum
      maximum = matrix[row][column]
    end

    row += 1
  end

  maxima1 << maximum
  product1 *= maximum
  column += 1
end

#2
maxima2 = matrix.transpose.map { |column_values| column_values.max }
product2 = maxima2.reduce(1) { |product, number| product * number }

puts "Матриця:"
matrix.each { |row| p row }

puts "Максимуми, спосіб 1: #{maxima1.inspect}"
puts "Максимуми, спосіб 2: #{maxima2.inspect}"
puts "Добуток, спосіб 1: #{product1}"
puts "Добуток, спосіб 2: #{product2}"
puts "Результати однакові: #{maxima1 == maxima2 && product1 == product2}"