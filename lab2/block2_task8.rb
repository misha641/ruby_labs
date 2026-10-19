matrix = [
  [2, 5, 1],
  [7, -3, 4],
  [6, 8, -9]
]

#1
minimum1 = matrix[0][0]
row = 0

while row < matrix.length
  column = 0

  while column < matrix[row].length
    if matrix[row][column] < minimum1
      minimum1 = matrix[row][column]
    end

    column += 1
  end

  row += 1
end

#2 
minimum2 = matrix.map { |row_values| row_values.min }.min

puts "Матриця:"
matrix.each { |row_values| p row_values }

puts "Спосіб 1: #{minimum1}"
puts "Спосіб 2: #{minimum2}"
puts "Результати однакові: #{minimum1 == minimum2}"