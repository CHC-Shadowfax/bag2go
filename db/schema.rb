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

ActiveRecord::Schema[7.0].define(version: 2023_06_17_232425) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bags", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "sku"
    t.text "features"
    t.float "price_day"
    t.boolean "available", default: true
    t.boolean "reserved", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bags_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.float "book_total_price"
    t.text "booking_desc"
    t.boolean "active", default: true
    t.date "real_end_date"
    t.bigint "user_id", null: false
    t.bigint "bag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bag_id"], name: "index_bookings_on_bag_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_phone"
    t.string "user_type"
    t.text "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bags", "users"
  add_foreign_key "bookings", "bags"
  add_foreign_key "bookings", "users"
end
