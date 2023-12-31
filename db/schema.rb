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

ActiveRecord::Schema[7.0].define(version: 2023_10_28_055547) do
  create_table "articles", charset: "utf8", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.date "display_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "del_flg", limit: 1
  end

  create_table "generations", charset: "utf8", force: :cascade do |t|
    t.string "generation_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", charset: "utf8", force: :cascade do |t|
    t.string "class_code"
    t.string "title"
    t.text "text"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "poke_indices", charset: "utf8", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "soft_id"
    t.text "index_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemons", charset: "utf8", force: :cascade do |t|
    t.string "poke_name"
    t.integer "generation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "softs", charset: "utf8", force: :cascade do |t|
    t.string "soft_name"
    t.integer "generation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
