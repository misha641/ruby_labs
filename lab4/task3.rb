def positive?(number)
  number > 0
end

def adult?(age)
  age >= 18
end

puts "5 додатне? #{positive?(5)}"
puts "0 додатне? #{positive?(0)}"
puts "-3 додатне? #{positive?(-3)}"

puts "17 років — повнолітній? #{adult?(17)}"
puts "18 років — повнолітній? #{adult?(18)}"
puts "25 років — повнолітній? #{adult?(25)}"