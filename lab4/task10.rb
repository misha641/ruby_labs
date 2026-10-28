greeting = lambda { "Привіт із Lambda!" }

puts greeting.call


show_value = lambda do |value|
  "Отримане значення: #{value}"
end

puts "\nПравильна кількість аргументів:"
puts show_value.call(10)

puts "\nБез аргументу:"
begin
  puts show_value.call
rescue ArgumentError
  puts "Помилка: потрібно передати рівно один аргумент."
end

puts "\nЗайвий аргумент:"
begin
  puts show_value.call(10, 20)
rescue ArgumentError
  puts "Помилка: потрібно передати рівно один аргумент."
end


def test_lambda_return
  action = lambda do
    return "Повернули результат із Lambda"
  end

  puts action.call
  "Метод продовжив роботу після виклику Lambda"
end

puts "\nПеревірка return:"
puts test_lambda_return