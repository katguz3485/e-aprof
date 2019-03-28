# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :item_category
  belongs_to :user
end
