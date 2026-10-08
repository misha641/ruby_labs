transactions = [
  { type: :income, amount: 500 },
  { type: :expense, amount: 150 },
  { type: :expense, amount: 100 },
   { type: :expense, amount: 50 }
]

incomes = transactions.select { |transaction| transaction[:type] == :income }
expenses = transactions.select { |transaction| transaction[:type] == :expense }

total_income = incomes.sum { |transaction| transaction[:amount] }
total_expenses = expenses.sum { |transaction| transaction[:amount] }

balance = total_income - total_expenses

puts "Загальний дохід: #{total_income} грн"
puts "Загальні витрати: #{total_expenses} грн"
puts "Баланс: #{balance} грн"