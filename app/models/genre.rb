class Genre < ApplicationRecord
  has_many :restaurant_genres
  has_many :restaurants, through: :restaurant_genres

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end

end
