require 'open-uri'
require 'json'

url = 'https://tmdb.lewagon.com/movie/top_rated'
movies = JSON.parse(URI.open(url).read)['results']

i = 0

10.times do
  movie = Movie.new(
    title: movies[i]['title'],
    overview: movies[i]['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{movies[i]['poster_path']}",
    rating: movies[i]['vote_average']
  )
  movie.save
  i += 1
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
