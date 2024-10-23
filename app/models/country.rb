class Country < ApplicationRecord
  has_many :restaurant_countries
  has_many :restaurants, through: :restaurant_countries

  def self.ransackable_attributes(auth_object = nil)
    ["name", "region"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
