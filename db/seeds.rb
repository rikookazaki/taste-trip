# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

# countriesテーブル初期値設定
csv_text = File.read(Rails.root.join('db', 'seeds', 'countries.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  Country.create!(
    name: row['name'],
    region: row['region'],
  )
end

# genresテーブル初期値設定
csv_text = File.read(Rails.root.join('db', 'seeds', 'genres.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  Genre.create!(
    name: row['name'],
  )
end

# situarionsテーブル初期値設定
csv_text = File.read(Rails.root.join('db', 'seeds', 'situations.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  Situation.create!(
    name: row['name'],
  )
end


# restaurantsテーブルにGooglePlacesAPIで取得した情報を初期値として設定
service = GooglePlacesService.new

def save_restaurants(service, cuisine, country_name)
  places = service.send("fetch_#{cuisine.downcase}_restaurants")
  country = Country.find_by(name: country_name)

  places.each do |place|
    place_details = service.fetch_place_details(place.place_id)
    
    formatted_address = place_details.formatted_address || '不明'
    international_phone_number = place_details.international_phone_number || '不明'
    opening_hours = place_details.opening_hours&.dig('weekday_text')&.join(", ")

    if formatted_address.present? && !Restaurant.exists?(name: place.name, address: formatted_address)
      restaurant = Restaurant.create(
        name: place.name,
        address: formatted_address,
        phone_num: international_phone_number,
        website: place.website,
        opening_hours: opening_hours
      )
      restaurant.countries << country if restaurant.persisted? && country.present?
    end
  end
end

save_restaurants(service, 'Italian', 'イタリア')
save_restaurants(service, 'French', 'フランス')
save_restaurants(service, 'Chinese', '中国')
save_restaurants(service, 'Mexican', 'メキシコ')
save_restaurants(service, 'Indian', 'インド')
save_restaurants(service, 'Korean', '韓国')
save_restaurants(service, 'Thai', 'タイ')
save_restaurants(service, 'Spanish', 'スペイン')
save_restaurants(service, 'Vietnamese', 'ベトナム')
save_restaurants(service, 'Greek', 'ギリシャ')