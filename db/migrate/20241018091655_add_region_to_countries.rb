class AddRegionToCountries < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :region, :string
  end
end
