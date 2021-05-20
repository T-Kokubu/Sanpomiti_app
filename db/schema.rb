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

ActiveRecord::Schema.define(version: 2021_05_09_140101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "like_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["like_id"], name: "index_favorites_on_like_id"
    t.index ["user_id", "like_id"], name: "index_favorites_on_user_id_and_like_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spots", force: :cascade do |t|
    t.bigint "walkcourse_id"
    t.string "name"
    t.integer "transit_time"
    t.integer "time_required"
    t.string "address"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "spotpic"
    t.float "latitude"
    t.float "longitude"
    t.index ["walkcourse_id"], name: "index_spots_on_walkcourse_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "prefecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_users_on_prefecture_id"
  end

  create_table "walkcourses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "coursepic"
    t.string "start_station"
    t.integer "time_to_first_spot"
    t.string "goal_station"
    t.index ["user_id"], name: "index_walkcourses_on_user_id"
  end

  add_foreign_key "favorites", "users"
  add_foreign_key "favorites", "walkcourses", column: "like_id"
  add_foreign_key "spots", "walkcourses"
  add_foreign_key "walkcourses", "users"
end
