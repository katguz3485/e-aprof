class PurchaseOrder < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments
  has_many :item_categories
  has_many :items, through: :item_category
  belongs_to :grant

end
