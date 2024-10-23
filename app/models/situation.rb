class Situation < ApplicationRecord
  has_many :restaurant_situations
  has_many :restaurants, through: :restaurant_situations

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end

end
