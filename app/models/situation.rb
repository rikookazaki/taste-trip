class Situation < ApplicationRecord
  has_many :restaurant_situations
  has_many :restaurants, through: :restaurant_situations
end
