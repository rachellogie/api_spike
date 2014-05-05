require 'json'
require 'faraday'
require 'dotenv'
Dotenv.load

conn = Faraday.new 'https://www.pivotaltracker.com/services/v5/projects'

response = conn.get do |req|
  req.url 'https://www.pivotaltracker.com/services/v5/projects'
  req.headers['X-TrackerToken'] = ENV['TOKEN']
end

json_data = response.body

projects = JSON.parse(json_data).map { |story| story["name"]}

puts projects


