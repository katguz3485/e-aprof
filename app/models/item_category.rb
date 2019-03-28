# frozen_string_literal: true

class ItemCategory < ApplicationRecord
  has_many :items
end
