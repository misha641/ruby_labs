require "json"

filepath = File.join(__dir__, "data", "input.json")

unless File.file?(filepath)
  abort "Файл не знайдено: #{filepath}"
end

#1
text1 = File.read(filepath, encoding: "UTF-8")
data1 = JSON.parse(text1)

#2
data2 = File.open(filepath, "r:UTF-8") do |file|
  JSON.parse(file.read)
end

puts "Робоча папка запуску: #{Dir.pwd}"
puts "Шлях до файла: #{filepath}"

puts "\nСпосіб 1:"
puts JSON.pretty_generate(data1)

puts "\nСпосіб 2:"
puts JSON.pretty_generate(data2)

puts "\nРезультати однакові: #{data1 == data2}"