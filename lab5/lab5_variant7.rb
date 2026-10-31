module DeviceInfo
  def details
    "#{name} (#{brand}), потужність: #{power} Вт"
  end
end

module DeviceStatistics
  def category
    'Побутова техніка'
  end
end

class Appliance
  include DeviceInfo
  extend DeviceStatistics

  attr_reader :name, :brand, :power
  attr_accessor :mode

  def initialize(name, brand, power)
    raise ArgumentError, 'Потужність повинна бути додатною' unless power.positive?

    @name = name
    @brand = brand
    @power = power
    @mode = 'стандартний'
    @on = false
  end

  def power=(value)
    raise ArgumentError, 'Потужність повинна бути додатною' unless value.positive?

    @power = value
  end

  def turn_on
    @on = true
    "#{name}: увімкнено"
  end

  def turn_off
    @on = false
    "#{name}: вимкнено"
  end

  def status
    "#{name}: #{on? ? 'працює' : 'вимкнено'}, режим: #{mode}"
  end

  def self.description
    'Загальний клас побутових приладів'
  end

  protected

  def on?
    @on
  end
end

class WashingMachine < Appliance
  attr_reader :load_kg

  def initialize(name, brand, power, load_kg)
    super(name, brand, power)
    @load_kg = load_kg
  end

  def turn_on
    "#{super}. Можна запускати прання"
  end

  def work
    return 'Спочатку увімкніть пральну машину' unless on?

    "Прання запущено (#{load_kg} кг, режим: #{mode})"
  end

  def self.description
    "#{super}; підклас для прання одягу"
  end
end

class VacuumCleaner < Appliance
  def work
    return 'Спочатку увімкніть пилосос' unless on?

    "Прибирання розпочато (режим: #{mode})"
  end
end

class Microwave < Appliance
  def work
    return 'Спочатку увімкніть мікрохвильовку' unless on?

    "Розігрів їжі розпочато (режим: #{mode})"
  end
end

washer = WashingMachine.new('Пральна машина', 'Samsung', 2000, 7)
vacuum = VacuumCleaner.new('Пилосос', 'Philips', 900)
microwave = Microwave.new('Мікрохвильовка', 'LG', 1200)

puts "Категорія (extend): #{Appliance.category}"
puts "Класовий синглтон-метод: #{WashingMachine.description}"
puts

# Гет-сет 
puts "Початкова потужність: #{vacuum.power} Вт"
vacuum.power = 1000
puts "Нова потужність: #{vacuum.power} Вт"
puts

# Полі
[washer, vacuum, microwave].each do |device|
  device.mode = 'економний'
  puts device.details
  puts device.turn_on
  puts device.work
  puts device.status
  puts device.turn_off
  puts
end


def microwave.status
  "Особливий статус: #{super}"
end
puts microwave.status
