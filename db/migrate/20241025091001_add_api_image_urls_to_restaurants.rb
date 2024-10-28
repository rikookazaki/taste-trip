class AddApiImageUrlsToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :api_image_urls, :text
  end
end
