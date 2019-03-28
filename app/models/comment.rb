# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :title, :description, presence: true
  belongs_to :purchase_order
  belongs_to :user
end
