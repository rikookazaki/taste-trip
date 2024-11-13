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

  def fetch_turkish_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のトルコ料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Turkish', language: 'ja')
  end

  def fetch_brazilian_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のブラジル料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Brazilian', language: 'ja')
  end

  def fetch_american_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のアメリカ料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'American', language: 'ja')
  end

  def fetch_russian_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のロシア料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Russian', language: 'ja')
  end

  def fetch_lebanese_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のレバノン料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Lebanese', language: 'ja')
  end

  def fetch_moroccan_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のモロッコ料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Moroccan', language: 'ja')
  end

  def fetch_african_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のアフリカ料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'African', language: 'ja')
  end

  def fetch_persian_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のペルシャ料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Persian', language: 'ja')
  end

  def fetch_caribbean_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内のカリブ料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Caribbean', language: 'ja')
  end

  def fetch_mediterranean_restaurants
    # 渋谷駅の緯度・経度を指定し、半径10km以内の地中海料理屋を取得
    @client.spots(35.658034, 139.701636, radius: 10000, types: 'restaurant', keyword: 'Mediterranean', language: 'ja')
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
