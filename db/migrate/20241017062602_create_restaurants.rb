class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null:false
      t.string :address, null: false
      t.string :access
      t.text :description
      t.string :phone_num, null: false
      t.string :opening_hours
      t.string :website
      t.string :payment
      t.timestamps
    end
  end
end
