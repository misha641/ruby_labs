seconds = 125
SECONDS_PER_MINUTE = 60

minutes = seconds / SECONDS_PER_MINUTE
other_seconds = seconds % SECONDS_PER_MINUTE

puts "#{seconds} секунд = #{minutes} хв та #{other_seconds} с"