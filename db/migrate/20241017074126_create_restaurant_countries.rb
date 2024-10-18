class CreateRestaurantCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurant_countries do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true
      t.timestamps
    end
  end
end
