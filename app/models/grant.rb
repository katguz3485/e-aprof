# frozen_string_literal: true

class Grant < ApplicationRecord
  validates :grant_name, :grant_code, presence: true
  has_many :purchase_orders
end
