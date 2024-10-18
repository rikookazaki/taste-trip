class AddIsoCodeToCountries < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :iso_code, :string
  end
end
