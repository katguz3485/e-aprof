# frozen_string_literal: true

FactoryBot.define do
  factory :user_order do
    name { 'MyString' }
    user
    purchase_order
  end
end
