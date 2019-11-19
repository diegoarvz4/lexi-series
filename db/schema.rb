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

ActiveRecord::Schema.define(version: 2019_11_19_170253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_images", force: :cascade do |t|
    t.bigint "character_id"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_images_on_character_id"
  end

  create_table "character_tags", force: :cascade do |t|
    t.bigint "character_id"
    t.bigint "series_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_tags_on_character_id"
    t.index ["series_id"], name: "index_character_tags_on_series_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "picture"
    t.string "name"
    t.string "role"
    t.string "description"
    t.bigint "series_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dubcard_id"
    t.string "naming"
    t.string "catch_phrases"
    t.string "treatment"
    t.index ["dubcard_id"], name: "index_characters_on_dubcard_id"
    t.index ["series_id"], name: "index_characters_on_series_id"
  end

  create_table "dubcards", force: :cascade do |t|
    t.bigint "episode_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["episode_id"], name: "index_dubcards_on_episode_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.integer "number"
    t.string "resume"
    t.bigint "series_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "dubcard_characters"
    t.index ["series_id"], name: "index_episodes_on_series_id"
  end

  create_table "glosaries", force: :cascade do |t|
    t.bigint "series_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["series_id"], name: "index_glosaries_on_series_id"
  end

  create_table "quality_controls", force: :cascade do |t|
    t.string "feedback"
    t.integer "reviewer_id"
    t.integer "effectiveness"
    t.integer "final_score"
    t.integer "loops"
    t.integer "max_score"
    t.integer "reduced_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "translation_id"
    t.string "grade"
    t.index ["reviewer_id"], name: "index_quality_controls_on_reviewer_id"
    t.index ["translation_id"], name: "index_quality_controls_on_translation_id"
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

  create_table "roles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "series", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.string "picture"
    t.string "instructions"
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

  create_table "terms", force: :cascade do |t|
    t.bigint "glosary_id"
    t.string "src_term"
    t.string "dst_term"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["glosary_id"], name: "index_terms_on_glosary_id"
  end

  create_table "translations", force: :cascade do |t|
    t.bigint "episode_id"
    t.integer "translator_id"
    t.string "status", default: "in progress"
    t.datetime "duedate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "src_lang"
    t.string "dst_lang"
    t.integer "runtime"
    t.index ["episode_id"], name: "index_translations_on_episode_id"
    t.index ["translator_id"], name: "index_translations_on_translator_id"
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
    t.string "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "character_images", "characters", on_delete: :cascade
  add_foreign_key "character_tags", "characters"
  add_foreign_key "character_tags", "series"
  add_foreign_key "characters", "dubcards"
  add_foreign_key "characters", "series", on_delete: :cascade
  add_foreign_key "dubcards", "episodes", on_delete: :cascade
  add_foreign_key "episodes", "series", on_delete: :cascade
  add_foreign_key "glosaries", "series", on_delete: :cascade
  add_foreign_key "quality_controls", "translations", on_delete: :cascade
  add_foreign_key "quality_controls", "users", column: "reviewer_id"
  add_foreign_key "relationships", "characters", column: "related_id", on_delete: :cascade
  add_foreign_key "relationships", "characters", on_delete: :cascade
  add_foreign_key "roles", "users"
  add_foreign_key "series_requests", "series", on_delete: :cascade
  add_foreign_key "series_requests", "users", column: "receiver_id"
  add_foreign_key "series_requests", "users", column: "requester_id"
  add_foreign_key "terms", "glosaries", on_delete: :cascade
  add_foreign_key "translations", "episodes", on_delete: :cascade
  add_foreign_key "translations", "users", column: "translator_id", on_delete: :cascade
end
