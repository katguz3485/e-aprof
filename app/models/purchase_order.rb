# frozen_string_literal: true

class PurchaseOrder < ApplicationRecord
  has_many :comments, as: :commentable

  has_many :user_orders, dependent: :destroy
  has_many :users, through: :user_orders

  has_many :item_categories
  has_many :items, through: :item_categories
  has_many :expendables, class_name: 'Expendable'
  has_many :chemicals, class_name: 'Chemical'

  belongs_to :grant

  validates :name, presence: true
end
