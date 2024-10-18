# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_10_17_105456) do
  create_table "countries", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurant_countries", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_restaurant_countries_on_country_id"
    t.index ["restaurant_id"], name: "index_restaurant_countries_on_restaurant_id"
  end

  create_table "restaurant_genres", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_restaurant_genres_on_genre_id"
    t.index ["restaurant_id"], name: "index_restaurant_genres_on_restaurant_id"
  end

  create_table "restaurant_situations", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.bigint "situation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_restaurant_situations_on_restaurant_id"
    t.index ["situation_id"], name: "index_restaurant_situations_on_situation_id"
  end

  create_table "restaurants", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "access"
    t.text "description"
    t.string "phone_num", null: false
    t.string "opening_hours"
    t.string "website"
    t.string "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "situations", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "restaurant_countries", "countries"
  add_foreign_key "restaurant_countries", "restaurants"
  add_foreign_key "restaurant_genres", "genres"
  add_foreign_key "restaurant_genres", "restaurants"
  add_foreign_key "restaurant_situations", "restaurants"
  add_foreign_key "restaurant_situations", "situations"
end
