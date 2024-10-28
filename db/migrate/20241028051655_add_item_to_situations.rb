class AddItemToSituations < ActiveRecord::Migration[7.0]
  def change
    add_column :situations, :item, :string
  end
end
