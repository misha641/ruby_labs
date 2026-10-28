class Product
  def initialize(price)
    @price = price
  end

  
  def price
    @price
  end


  def price=(new_price)
    @price = new_price
  end


  def +(other)
    @price + other.price
  end
end

product1 = Product.new(100)
product2 = Product.new(50)

puts "Початкова ціна першого товару: #{product1.price}"
puts "Сума цін: #{product1 + product2}"

product1.price = 120

puts "Нова ціна першого товару: #{product1.price}"
puts "Сума після зміни: #{product1 + product2}"