# frozen_string_literal: true

class UserOrder < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_order

end
