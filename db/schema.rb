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

ActiveRecord::Schema.define(version: 2022_05_31_000454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "description"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "city"
    t.bigint "region_id", null: false
    t.decimal "latitude"
    t.decimal "longitude"
    t.integer "elevation_meters"
    t.boolean "on_water"
    t.integer "population"
    t.float "monthly_after_tax_salary"
    t.float "apt_price_per_meter2_outside_city_center"
    t.float "apt_price_per_meter2_inside_city_center"
    t.float "monthly_rent_one_bdrm_outside_city_center"
    t.float "monthly_rent_one_bdrm_inside_city_center"
    t.float "monthly_utilities"
    t.float "monthly_internet"
    t.string "wikidata_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "airport"
    t.boolean "coastal"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "currency"
    t.string "language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "income_min"
    t.integer "income_max"
    t.float "tax_min"
    t.float "tax_max"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.string "political_party"
    t.float "tax_min"
    t.float "tax_max"
    t.integer "income_min"
    t.integer "income_max"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id", default: 1, null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "user_cities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.bigint "city_id", null: false
    t.text "note"
    t.float "distance_from"
    t.integer "postalcode"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_user_cities_on_category_id"
    t.index ["city_id"], name: "index_user_cities_on_city_id"
    t.index ["user_id"], name: "index_user_cities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "sub"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "city_id"
    t.integer "salary"
    t.index ["city_id"], name: "index_users_on_city_id"
  end

  add_foreign_key "categories", "users"
  add_foreign_key "regions", "countries"
  add_foreign_key "user_cities", "categories"
  add_foreign_key "user_cities", "cities"
  add_foreign_key "user_cities", "users"
  add_foreign_key "users", "cities"
end
