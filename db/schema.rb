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

ActiveRecord::Schema.define(version: 2018_12_16_004755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "categories_properties", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "property_id"
    t.index ["category_id"], name: "index_categories_properties_on_category_id"
    t.index ["property_id"], name: "index_categories_properties_on_property_id"
  end

  create_table "category_fields", force: :cascade do |t|
    t.string "name"
    t.string "field_type"
    t.boolean "required"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_fields_on_category_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.integer "category_id"
  end

  create_table "products_properties", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "property_id"
    t.index ["product_id"], name: "index_products_properties_on_product_id"
    t.index ["property_id"], name: "index_products_properties_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "field_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "options"
  end

  create_table "property_values", force: :cascade do |t|
    t.string "field_value"
    t.bigint "property_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_property_values_on_product_id"
    t.index ["property_id"], name: "index_property_values_on_property_id"
  end

  add_foreign_key "category_fields", "categories"
end
