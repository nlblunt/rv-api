# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_03_010807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rvparks", force: :cascade do |t|
    t.string "parkName"
    t.boolean "private", default: false
    t.boolean "public", default: true
    t.string "membership"
    t.float "lat"
    t.float "lng"
    t.string "icon"
    t.string "googleId"
    t.string "phoneNumber"
    t.float "rating"
    t.string "address"
    t.integer "zip"
    t.string "website"
    t.string "reservation"
    t.float "price"
    t.text "description"
    t.boolean "pets", default: false
    t.boolean "laundry", default: false
    t.boolean "bigrigs", default: false
    t.boolean "paved", default: false
    t.boolean "dirt", default: false
    t.boolean "gravel", default: false
    t.boolean "dumpstation", default: false
    t.boolean "tents", default: false
    t.boolean "store", default: false
    t.boolean "wifi", default: false
    t.boolean "cell", default: false
    t.boolean "cabletv", default: false
    t.boolean "firepits", default: false
    t.boolean "bbqs", default: false
    t.boolean "picnictables", default: false
    t.boolean "playground", default: false
    t.boolean "communityarea", default: false
    t.boolean "visa", default: false
    t.boolean "mastercard", default: false
    t.boolean "check", default: false
    t.boolean "verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
