# frozen_string_literal: true
# t.string "type", null: false
# t.bigint "user_id", null: false
# t.string "item_name", default: "", null: false
# t.string "link", default: "", null: false
# t.decimal "item_price", precision: 8, scale: 2
# t.string "catalogue_number", default: "", null: false
# t.string "provider_name", default: "", null: false
# t.string "number_of_items", default: "", null: false
# t.string "packaging", default: "", null: false
# t.string "remarks", default: "", null: false
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.bigint "item_category_id"
# t.index ["item_category_id"], name: "index_items_on_item_category_id"
# t.index ["user_id"], name: "index_items_on_user_id"

class Item < ApplicationRecord
  belongs_to :item_category
  belongs_to :user

  scope :chemicals, -> { where(type: 'Chemical') }
  scope :expendables, -> { where(type: 'Expendables') }

  validates :type, presence: true
  validates :item_name, presence: true
  validates :link, presence: true
  validates :item_price, presence: true
  validates :catalogue_number, presence: true
  validates :provider_name, presence: true
  validates :number_of_items, presence: true
  validates :packaging, presence: true
end
