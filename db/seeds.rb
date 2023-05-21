# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require "byebug"
require "dotenv/load"
require 'date'
require "httparty"
require "json"

def call_api(url)
  response = HTTParty.get(url)

  if response.success?
    puts response.body
    json_object = JSON.parse(response.body, object_class: OpenStruct)
    Movie.find_or_create_by(
        title: json_object.original_title,
        imdb_id: json_object.imdb_id,
        overview: json_object.overview,
        genres: json_object.genres,
        release_date: json_object.release_date,
        tagline: json_object.tagline,
        raw_data: response.body
    )
  else
    puts "Error: #{response.code} - #{response.message}"
  end
rescue HTTParty::Error => e
  puts "HTTParty error: #{e.message}"
rescue StandardError => e
  puts "Error: #{e.message}"
end

# Example usage

api_key = ENV["MOVIEDB_API_KEY"]

movie_id = 550
while movie_id <= 560
  puts "#### Getting data for #{movie_id}"
  url = "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{api_key}"
  call_api(url)

  movie_id += 1
end