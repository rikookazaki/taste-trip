class Restaurant < ApplicationRecord
  has_many :restaurant_countries
  has_many :countries, through: :restaurant_countries

  has_many :restaurant_genres
  has_many :genres, through: :restaurant_genres

  has_many :restaurant_situations
  has_many :situations, through: :restaurant_situations
end
