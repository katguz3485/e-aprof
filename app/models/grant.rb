class Grant < ApplicationRecord
  has_many :purchase_orders
end
