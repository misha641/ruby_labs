words = ["кіт", "програма", "масив", "студент", "код", "ноутбук"]

lengths = words.map { |word| word.length }
large_lengths = lengths.select { |length| length > 5 }

puts "Слова: #{words.inspect}"
puts "Довжини: #{lengths.inspect}"
puts "Довжини понад 5: #{large_lengths.inspect}"