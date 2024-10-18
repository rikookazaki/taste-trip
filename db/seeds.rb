# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('db', 'seeds', 'countries.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  Country.create!(
    name: row['name'],
  )
end

csv_text = File.read(Rails.root.join('db', 'seeds', 'genres.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  Genre.create!(
    name: row['name'],
  )
end

csv_text = File.read(Rails.root.join('db', 'seeds', 'situations.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  Situation.create!(
    name: row['name'],
  )
end