require 'json'
require 'faraday'
require 'dotenv'
Dotenv.load

conn = Faraday.new 'https://www.pivotaltracker.com/services/v5/projects/1067890/stories/70650190'

response = conn.get do |req|
  req.url 'https://www.pivotaltracker.com/services/v5/projects/1067890/stories/70650190'
  req.headers['X-TrackerToken'] = ENV['TOKEN']
end

json_data = response.body

JSON.parse(json_data).each do |key, value|
  puts "#{key} : #{value}"
end




