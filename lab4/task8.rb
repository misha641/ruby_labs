def run_block
  if block_given?
    yield
  else
    "Блок не передано"
  end
end


def process_number(number)
  if block_given?
    yield(number)
  else
    "Блок не передано"
  end
end

puts "Без аргументів:"
puts run_block { "Привіт із блоку!" }

puts "\nЗ аргументом:"
puts process_number(5) { |number| number * 3 }

puts "\nВиклики без блоку:"
puts run_block
puts process_number(5)