require 'json'
require 'faraday'

response = Faraday.get 'http://api.openweathermap.org/data/2.5/forecast/daily?q=Moab,UT&cnt=7&mode=json'

json_data = response.body

JSON.parse(json_data)["list"].each do |day|
   puts "For #{Time.at(day["dt"]).to_s[0..9]} it will be #{day["temp"]["day"]} degrees kelvin during the day and  #{day["weather"].first["description"]}"
end





