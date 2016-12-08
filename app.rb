require 'rubygems'
require 'rubyserial'
require 'rpi_gpio'
# require 'mqtt'

# client = MQTT::Client.connect(
#   :host     => ENV['MQTT_HOST'],
#   :port     => 8883,
#   :ssl      => true,
#   :username => ENV['MQTT_USER'],
#   :password => ENV['MQTT_PASSWORD']
# )

# Setup Relays
UP_PIN = ENV['UP_GPIO_PIN'].to_i
DOWN_PIN = ENV['DOWN_GPIO_PIN'].to_i

RPi::GPIO.set_numbering :bcm
RPi::GPIO.setup UP_PIN,   :as => :output
RPi::GPIO.setup DOWN_PIN, :as => :output

serialport = Serial.new ENV['DISTANCE_DEVICE']

# Test Device Goes Up 5 seconds
RPi::GPIO.set_high UP_PIN
sleep 5
RPi::GPIO.set_low UP_PIN

# Test Device goes down 5 seconds
RPi::GPIO.set_high DOWN_PIN
sleep 5
RPi::GPIO.set_low DOWN_PIN

puts "Done"
sleep 9999999
