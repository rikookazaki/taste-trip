class Restaurant < ApplicationRecord
  has_many :restaurant_countries
  has_many :countries, through: :restaurant_countries

  has_many :restaurant_genres
  has_many :genres, through: :restaurant_genres

  has_many :restaurant_situations
  has_many :situations, through: :restaurant_situations

  has_many_attached :images

  def self.ransackable_attributes(auth_object = nil)
    ["access", "address", "created_at", "description", "id", "name", "opening_hours", "payment", "phone_num", "updated_at", "website"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["countries", "genres", "images_attachments", "images_blobs", "restaurant_countries", "restaurant_genres", "restaurant_situations", "situations"]
  end

  # JSON形式で保存されている画像URLを配列として扱うメソッド
  def image_urls
    JSON.parse(api_image_urls || '[]')
  end

end
