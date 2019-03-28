# frozen_string_literal: true

class PurchaseOrder < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments
  has_many :item_categories
  has_many :items, through: :item_categories
  belongs_to :grant

  validates :name, presence: true


end
