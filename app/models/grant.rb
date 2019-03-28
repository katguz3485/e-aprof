# frozen_string_literal: true

class Grant < ApplicationRecord
  has_many :purchase_orders
end
