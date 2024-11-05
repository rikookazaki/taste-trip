class AddStatusToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :status, :string, default: "pending", null: false
  end
end
