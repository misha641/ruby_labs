def greet(name)
  "Привіт, #{name}!"
end

alias welcome greet

puts greet("Міша")
puts welcome("Міша")

def greet(name)
  "Добрий день, #{name}!"
end

puts "\nПісля перевизначення:"
puts greet("Анна")
puts welcome("Анна")