# frozen_string_literal: true

class PurchaseOrder < ApplicationRecord

  scope :chemicals, -> {where(purchase_order_type: 'Chemical')}
  scope :expendables, -> {where(purchase_order_type: 'Expendable')}

  has_many :comments, as: :commentable

  has_many :user_orders, dependent: :destroy
  has_many :users, through: :user_orders

  has_many :item_categories, dependent: :destroy
  has_many :items, through: :item_categories
  has_many :expendables, class_name: 'Expendable'
  has_many :chemicals, class_name: 'Chemical'

  belongs_to :grant

  validates :name, presence: true
end
