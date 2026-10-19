require "find"
require "digest"

directory = File.expand_path(
  ARGV[0] || File.join(__dir__, "test_files")
)

unless Dir.exist?(directory)
  abort "Папка не існує: #{directory}"
end

#1
groups1 = {}

Find.find(directory) do |path|
  next unless File.file?(path)

  checksum = Digest::SHA256.file(path).hexdigest

  groups1[checksum] ||= []
  groups1[checksum] << path
end

duplicates1 = groups1.values.select { |paths| paths.length > 1 }

#2
paths = Dir.glob(
  "**/*",
  File::FNM_DOTMATCH,
  base: directory
)

files = paths.map { |path| File.join(directory, path) }
files = files.select { |path| File.file?(path) }

groups2 = files.group_by do |path|
  Digest::SHA256.file(path).hexdigest
end

duplicates2 = groups2.values.select { |group| group.length > 1 }

duplicates1 = duplicates1.map { |group| group.sort }.sort
duplicates2 = duplicates2.map { |group| group.sort }.sort

puts "Папка: #{directory}"

puts "\nСпосіб 1:"
if duplicates1.empty?
  puts "Однакових файлів не знайдено."
else
  duplicates1.each_with_index do |group, index|
    puts "Група #{index + 1}:"
    group.each { |path| puts "  #{path}" }
  end
end

puts "\nСпосіб 2:"
if duplicates2.empty?
  puts "Однакових файлів не знайдено."
else
  duplicates2.each_with_index do |group, index|
    puts "Група #{index + 1}:"
    group.each { |path| puts "  #{path}" }
  end
end

puts "\nРезультати однакові: #{duplicates1 == duplicates2}"