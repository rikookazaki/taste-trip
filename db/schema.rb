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

ActiveRecord::Schema[7.0].define(version: 2024_10_29_085644) do
  create_table "active_storage_attachments", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "countries", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "region"
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
    t.text "opening_hours"
    t.string "website"
    t.string "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "api_image_urls"
  end

  create_table "situations", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "item"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.date "birthday"
    t.integer "gender"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "restaurant_countries", "countries"
  add_foreign_key "restaurant_countries", "restaurants"
  add_foreign_key "restaurant_genres", "genres"
  add_foreign_key "restaurant_genres", "restaurants"
  add_foreign_key "restaurant_situations", "restaurants"
  add_foreign_key "restaurant_situations", "situations"
end
