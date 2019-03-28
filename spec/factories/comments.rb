# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    purchase_order
    description { 'MyString' }
    title { 'MyString' }

  end
end
