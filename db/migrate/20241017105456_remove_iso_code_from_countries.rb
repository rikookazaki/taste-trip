class RemoveIsoCodeFromCountries < ActiveRecord::Migration[7.0]
  def change
    remove_column :countries, :iso_code, :string
  end
end
