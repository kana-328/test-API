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

ActiveRecord::Schema.define(version: 2020_11_30_160821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prefecture_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "title", null: false
    t.text "descript", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "images"
    t.string "day"
    t.integer "city_id"
    t.integer "prefecture_id"
    t.bigint "photographer_id"
    t.index ["photographer_id"], name: "index_packages_on_photographer_id"
  end

  create_table "packages_and_categories", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "package_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages_and_tags", force: :cascade do |t|
    t.integer "package_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photographers", force: :cascade do |t|
    t.string "name"
    t.text "descript"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accepted", default: false, null: false
    t.string "address", default: "", null: false
    t.string "image"
    t.string "email", default: "", null: false
    t.string "password_digest"
    t.string "remember_digest"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "packages", "photographers"
end
