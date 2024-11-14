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
    item: row['item']
  )
end


# restaurantsテーブルにGooglePlacesAPIで取得した情報を初期値として設定
service = GooglePlacesService.new

def save_restaurants(service, cuisine, country_name)
  places = service.send("fetch_#{cuisine.downcase}_restaurants")
  country = Country.find_by(name: country_name)

  places.each do |place|
    # place_idがすでに保存済みだった場合はスキップ
    next if Restaurant.exists?(place_id: place.place_id)

    place_details = service.fetch_place_details(place.place_id)
    
    formatted_address = place_details.formatted_address || '不明'
    international_phone_number = place_details.international_phone_number || '不明'
    opening_hours = place_details.opening_hours&.dig('weekday_text')&.join(", ")

    # 電話番号をフォーマット
    formatted_phone_number = format_phone_number(international_phone_number)

    # 画像URLを最大3枚取得
    image_urls = service.fetch_image_urls(place_details)

    def sanitize_text(text)
      return '' if text.nil?

      text.encode('UTF-8', invalid: :replace, undef: :replace, replace: '').gsub(/\p{Emoji}/, '')
    end

    if formatted_address.present? && !Restaurant.exists?(name: place.name, address: formatted_address)
      restaurant = Restaurant.new(
        name: sanitize_text(place.name),
        place_id: place.place_id,
        address: sanitize_text(formatted_address),
        phone_num: formatted_phone_number,
        website: place.website,
        opening_hours: opening_hours,
        api_image_urls: image_urls.to_json, # JSON形式で保存
        status: 'approved'
      )
    
      # 国情報との関連付け（中間テーブルを使う場合）
      restaurant.countries << country if country
      restaurant.save!
    end
  end
end

# 電話番号のフォーマットを行うメソッド
def format_phone_number(international_phone_number)
  return international_phone_number unless international_phone_number.start_with?('+81')

  # +81を取り除き、最初の0をつける
  domestic_phone_number = international_phone_number.sub('+81 ', '0')
  return domestic_phone_number
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
save_restaurants(service, 'Turkish', 'トルコ')
save_restaurants(service, 'Brazilian', 'ブラジル')
save_restaurants(service, 'American', 'アメリカ')
save_restaurants(service, 'Russian', 'ロシア')
save_restaurants(service, 'African', 'アフリカ')
save_restaurants(service, 'Persian', 'イラン')