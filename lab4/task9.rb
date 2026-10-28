# Proc без параметрів
greeting = proc { "Привіт із Proc!" }

puts greeting.call

show_value = proc do |value|
  "Отримане значення: #{value.inspect}"
end

puts "\nПеревірка аргументів:"
puts show_value.call(10)
puts show_value.call
puts show_value.call(10, 20)

def test_proc_return
  action = proc do
    return "Вийшли з методу через return у Proc"
  end

  action.call
  "Цей рядок не буде виконаний"
end

puts "\nПеревірка return:"
puts test_proc_return