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

ActiveRecord::Schema.define(version: 2019_05_17_104146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "commentable_type", null: false
    t.bigint "commentable_id", null: false
    t.string "description", default: "", null: false
    t.string "title", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "grants", force: :cascade do |t|
    t.string "grant_name", default: "", null: false
    t.string "grant_code", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_categories", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "purchase_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_order_id"], name: "index_item_categories_on_purchase_order_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "type", null: false
    t.bigint "user_id", null: false
    t.string "item_name", default: "", null: false
    t.string "link", default: "", null: false
    t.decimal "item_price", precision: 8, scale: 2
    t.string "catalogue_number", default: "", null: false
    t.string "provider_name", default: "", null: false
    t.string "number_of_items", default: "", null: false
    t.string "packaging", default: "", null: false
    t.string "remarks", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_category_id", null: false
    t.integer "cid", default: 0, null: false
    t.string "formula_url", default: "", null: false
    t.string "cas_number", default: "", null: false
    t.string "purity", default: "", null: false
    t.string "currency_name", default: "PLN", null: false
    t.index ["item_category_id"], name: "index_items_on_item_category_id"
    t.index ["type", "user_id"], name: "index_items_on_type_and_user_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "grant_id", null: false
    t.date "planned_order_date", null: false
    t.string "purchase_order_type", default: "", null: false
    t.index ["grant_id"], name: "index_purchase_orders_on_grant_id"
  end

  create_table "user_orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "purchase_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_order_id"], name: "index_user_orders_on_purchase_order_id"
    t.index ["user_id"], name: "index_user_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "users"
  add_foreign_key "item_categories", "purchase_orders"
  add_foreign_key "items", "item_categories"
  add_foreign_key "items", "users"
  add_foreign_key "purchase_orders", "grants"
  add_foreign_key "user_orders", "purchase_orders"
  add_foreign_key "user_orders", "users"
end
