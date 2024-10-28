require 'google_places'

class GooglePlacesService
  def initialize
    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_API_KEY'])
  end

  def fetch_italian_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のイタリアンを取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Italian', language: 'ja')
  end

  def fetch_french_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のフレンチを取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'French', language: 'ja')
  end

  def fetch_chinese_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内の中華を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Chinese', language: 'ja')
  end

  def fetch_mexican_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のメキシコ料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Mexican', language: 'ja')
  end

  def fetch_indian_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のインド料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Indian', language: 'ja')
  end

  def fetch_korean_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内の韓国料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Korean', language: 'ja')
  end

  def fetch_thai_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のタイ料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Thai', language: 'ja')
  end

  def fetch_spanish_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のスペイン料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Spanish', language: 'ja')
  end

  def fetch_vietnamese_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のベトナム料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Vietnamese', language: 'ja')
  end

  def fetch_greek_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のギリシャ料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Greek', language: 'ja')
  end

  def fetch_place_details(place_id)
    @client.spot(place_id)
  end

  # 画像URLを取得するメソッド
  def fetch_image_urls(place_details, max_images = 3)
    # place_details.photos から指定枚数の画像URLを取得
    place_details.photos.first(max_images).map do |photo|
      photo.fetch_url(800) # 800ピクセル幅の画像URLを取得
    end
  end
end
