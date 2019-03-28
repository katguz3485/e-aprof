# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    description { 'MyString' }
    title { 'MyString' }
    user
    purchase_order
  end
end
