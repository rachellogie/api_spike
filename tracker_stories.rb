require 'json'
require 'faraday'
require 'dotenv'
Dotenv.load

conn = Faraday.new 'https://www.pivotaltracker.com/services/v5/projects/1067890/stories'

response = conn.get do |req|
  req.url 'https://www.pivotaltracker.com/services/v5/projects/1067890/stories'
  req.headers['X-TrackerToken'] = ENV['TOKEN']
end

json_data = response.body

stories = JSON.parse(json_data).map {|story| story["name"]}

puts stories




