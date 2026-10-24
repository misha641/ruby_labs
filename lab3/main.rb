#1
employees = {
  "Анна" => "Бухгалтер",
  "Іван" => "Менеджер",
  "Олег" => "Тестувальник",
  "Ірина" => "Дизайнер",
  "Марія" => "Розробник",
  "Денис" => "Адміністратор",
  "Олена" => "Рекрутер",
  "Максим" => "Аналітик",
  "Назар" => "Маркетолог",
  "Софія" => "Керівник"
}

#5, 7 та 8, 
salaries = {
  "Анна" => 22000,
  "Іван" => 25000,
  "Олег" => 28000,
  "Ірина" => 24000,
  "Марія" => 40000,
  "Денис" => 20000,
  "Олена" => 23000,
  "Максим" => 32000,
  "Назар" => 0,
  "Софія" => nil
}


puts "Завдання 1. Працівники:"
employees.each do |name, position|
  puts "#{name} — #{position}"
end



puts "\nЗавдання 2. Індексний масив:"
employees_array = employees.to_a
p employees_array



puts "\nЗавдання 3. Сортування:"
puts "1 — за іменем"
puts "2 — за посадою"
print "Оберіть варіант: "

choice = gets.chomp

case choice
when "1"
  sorted_employees = employees.sort_by { |name, position| name }.to_h
when "2"
  sorted_employees = employees.sort_by { |name, position| position }.to_h
else
  sorted_employees = employees
  puts "Невідомий варіант. Виводимо початковий порядок."
end

sorted_employees.each do |name, position|
  puts "#{name} — #{position}"
end



puts "\nЗавдання 4. Три найкоротші імена:"
shortest_names = employees.sort_by { |name, position| name.length }
                          .first(3)
                          .to_h

shortest_names.each do |name, position|
  puts "#{name} — #{position}"
end



puts "\nЗавдання 5. П’ять найменших ненульових зарплат:"
lowest_salaries = salaries.select { |name, salary| !salary.nil? && salary > 0 }
                         .sort_by { |name, salary| salary }
                         .first(5)
                         .to_h

lowest_salaries.each do |name, salary|
  puts "#{name} — #{salary} грн"
end



puts "\nЗавдання 6. Пошук працівника:"
print "Введіть ім’я: "
search_name = gets.chomp.strip

if employees.key?(search_name)
  puts "#{search_name} — #{employees[search_name]}"
else
  puts "Працівника з таким ім’ям не знайдено."
end



puts "\nЗавдання 7. Загальна сума зарплат:"

known_salaries = salaries.reject { |name, salary| salary.nil? }
total_salary = known_salaries.sum { |name, salary| salary }

puts "Сума заданих зарплат: #{total_salary} грн"



puts "\nЗавдання 8. Заповнення зарплат:"

salaries.each do |name, salary|
  if salary.nil? || salary == 0
    loop do
      print "Введіть зарплату для #{name} (ціле число грн): "
      input = gets.chomp.strip

      if input.match?(/\A[0-9]+\z/) && input.to_i > 0
        salaries[name] = input.to_i
        break
      else
        puts "Введіть додатне ціле число, наприклад 25000."
      end
    end
  end
end

puts "\nОновлені зарплати:"
salaries.each do |name, salary|
  puts "#{name} — #{salary} грн"
end

total_salary = salaries.sum { |name, salary| salary }
puts "Загальна сума зарплат: #{total_salary} грн"