def introduce(name:, age: nil, city: "Невідомо")
  age_text = age.nil? ? "Не вказано" : age

  "Ім’я: #{name}, вік: #{age_text}, місто: #{city}"
end

puts introduce(name: "Міша")
puts introduce(name: "Анна", age: 22)
puts introduce(city: "Львів", name: "Олег", age: 25)