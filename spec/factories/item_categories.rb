# frozen_string_literal: true

FactoryBot.define do
  factory :item_category, class: 'ItemCategories' do
    name { 'MyString' }
    purchase_order
    item
  end
end
