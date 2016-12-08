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
RPi::GPIO.set_numbering :bcm
RPi::GPIO.setup ENV['UP_GPIO_PIN'],       :as => :output
RPi::GPIO.setup ENV['DOWN_GPIO_PIN'],     :as => :output

serialport = Serial.new ENV['DISTANCE_DEVICE']

# Test Device Goes Up 5 seconds
RPi::GPIO.set_high ENV['UP_GPIO_PIN']
sleep 5
RPi::GPIO.set_low ENV['UP_GPIO_PIN']

# Test Device goes down 5 seconds
RPi::GPIO.set_high ENV['DOWN_GPIO_PIN']
sleep 5
RPi::GPIO.set_low ENV['DOWN_GPIO_PIN']
