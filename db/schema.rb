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

ActiveRecord::Schema.define(version: 2019_09_23_182838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "picture"
    t.string "name"
    t.string "role"
    t.string "description"
    t.bigint "series_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["series_id"], name: "index_characters_on_series_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.integer "number"
    t.string "resume"
    t.bigint "series_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["series_id"], name: "index_episodes_on_series_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.string "type"
    t.string "description"
    t.bigint "character_id"
    t.integer "related_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_relationships_on_character_id"
    t.index ["related_id"], name: "index_relationships_on_related_id"
  end

  create_table "series", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.string "picture"
  end

  create_table "series_requests", force: :cascade do |t|
    t.integer "requester_id"
    t.integer "receiver_id"
    t.boolean "confirmed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "series_id"
    t.index ["receiver_id"], name: "index_series_requests_on_receiver_id"
    t.index ["requester_id"], name: "index_series_requests_on_requester_id"
    t.index ["series_id"], name: "index_series_requests_on_series_id"
  end

  create_table "series_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "series_id", null: false
    t.index ["series_id", "user_id"], name: "index_series_users_on_series_id_and_user_id"
    t.index ["user_id", "series_id"], name: "index_series_users_on_user_id_and_series_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "admin"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "characters", "series"
  add_foreign_key "episodes", "series"
  add_foreign_key "relationships", "characters"
  add_foreign_key "relationships", "characters", column: "related_id"
  add_foreign_key "series_requests", "series"
  add_foreign_key "series_requests", "users", column: "receiver_id"
  add_foreign_key "series_requests", "users", column: "requester_id"
end
