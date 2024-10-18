class Country < ApplicationRecord
  has_many :restaurant_countries
  has_many :restaurants, through: :restaurant_countries
end
