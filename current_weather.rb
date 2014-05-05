require 'json'
require 'faraday'

response = Faraday.get 'http://api.openweathermap.org/data/2.5/weather?q=Denver,CO'

json_data = response.body

weather_description = JSON.parse(json_data)["weather"].first["description"]

temperature = JSON.parse(json_data)["main"]["temp"].to_i
#convert to fahrenheit from kelvin
temperature = (1.8 * (temperature - 273.15) + 32).round(2)

puts "Denver is #{temperature} degrees fahrenheit and #{weather_description}"

