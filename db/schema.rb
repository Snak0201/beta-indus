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

ActiveRecord::Schema[8.1].define(version: 2025_11_22_160322) do
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

  add_foreign_key "birthday_characters", "birthday_brands"
end
