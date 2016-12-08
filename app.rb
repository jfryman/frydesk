require 'rubygems'
require 'mqtt'

client = MQTT::Client.connect(
  :host     => ENV['MQTT_HOST'],
  :port     => 8883,
  :ssl      => true,
  :username => ENV['MQTT_USER'],
  :password => ENV['MQTT_PASSWORD']
)

# Setup Relays
# RPi::GPIO.set_numbering :bcm
# RPi::GPIO.setup ENV['UP_GPIO_PIN'],       :as => :output
# RPi::GPIO.setup ENV['DOWN_GPIO_PIN'],     :as => :output
