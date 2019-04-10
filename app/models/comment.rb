# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  validates :title, :description, presence: true
  # belongs_to :purchase_order
  belongs_to :user
end
