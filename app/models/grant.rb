# frozen_string_literal: true

class Grant < ApplicationRecord
  validates :grant_name, :grant_code, presence: true
  has_many :purchase_orders

  def self.options_for_select
    Grant.order(grant_name: :desc).map {|grant| [grant.grant_name, grant.id]}
  end

end
