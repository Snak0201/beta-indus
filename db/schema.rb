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

ActiveRecord::Schema[8.1].define(version: 2026_08_23_092747) do
  create_table "birthday_brands", force: :cascade do |t|
    t.date "born_on", null: false
    t.string "color"
    t.datetime "created_at", null: false
    t.string "formal_name", null: false
    t.string "formal_name_kana", null: false
    t.string "name", null: false
    t.string "name_kana", null: false
    t.datetime "updated_at", null: false
  end

  create_table "birthday_characters", force: :cascade do |t|
    t.integer "birthday_brand_id"
    t.date "born_on", null: false
    t.string "color"
    t.datetime "created_at", null: false
    t.string "first_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name", null: false
    t.string "last_name_kana", null: false
    t.datetime "updated_at", null: false
    t.index ["birthday_brand_id"], name: "index_birthday_characters_on_birthday_brand_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "the_idolmaster_gakuen_characters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.string "voice"
  end

  create_table "the_idolmaster_gakuen_events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "held_on"
    t.string "kind"
    t.string "name"
    t.datetime "updated_at", null: false
    t.integer "venue_id", null: false
    t.index ["venue_id"], name: "index_the_idolmaster_gakuen_events_on_venue_id"
  end

  create_table "the_idolmaster_gakuen_performers", force: :cascade do |t|
    t.integer "character_id", null: false
    t.datetime "created_at", null: false
    t.integer "set_list_id", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_the_idolmaster_gakuen_performers_on_character_id"
    t.index ["set_list_id"], name: "index_the_idolmaster_gakuen_performers_on_set_list_id"
  end

  create_table "the_idolmaster_gakuen_set_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "event_id", null: false
    t.integer "song_id", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_the_idolmaster_gakuen_set_lists_on_event_id"
    t.index ["song_id"], name: "index_the_idolmaster_gakuen_set_lists_on_song_id"
  end

  create_table "the_idolmaster_gakuen_songs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.date "released_on"
    t.datetime "updated_at", null: false
  end

  create_table "the_idolmaster_gakuen_venues", force: :cascade do |t|
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "the_idolmaster_gakuen_vocals", force: :cascade do |t|
    t.integer "character_id", null: false
    t.datetime "created_at", null: false
    t.integer "song_id", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_the_idolmaster_gakuen_vocals_on_character_id"
    t.index ["song_id"], name: "index_the_idolmaster_gakuen_vocals_on_song_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "login_name", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["login_name"], name: "index_users_on_login_name", unique: true
  end

  add_foreign_key "birthday_characters", "birthday_brands"
  add_foreign_key "sessions", "users"
  add_foreign_key "the_idolmaster_gakuen_events", "venues"
  add_foreign_key "the_idolmaster_gakuen_performers", "characters"
  add_foreign_key "the_idolmaster_gakuen_performers", "set_lists"
  add_foreign_key "the_idolmaster_gakuen_set_lists", "events"
  add_foreign_key "the_idolmaster_gakuen_set_lists", "songs"
  add_foreign_key "the_idolmaster_gakuen_vocals", "characters"
  add_foreign_key "the_idolmaster_gakuen_vocals", "songs"
end
