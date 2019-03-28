# frozen_string_literal: true

class ItemCategory < ApplicationRecord

  has_many :items
  belongs_to :purchase_order
  validates :name, presence: true

end
