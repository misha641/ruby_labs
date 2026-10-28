def greet(name = "Гість")
  "Привіт, #{name}!"
end

puts "Початковий метод:"
puts greet
puts greet("Міша")

def greet(name = "Гість")
  "Вітаємо, #{name}! Раді вас бачити."
end

puts "\nПісля перевизначення:"
puts greet
puts greet("Міша")