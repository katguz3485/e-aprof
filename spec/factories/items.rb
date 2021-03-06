# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    type { '' }
    item_name { 'MyString' }
    link { 'MyString' }
    item_price { '9.99' }
    catalogue_number { 'MyString' }
    provider_name { 'MyString' }
    number_of_items { 'MyString' }
    packaging { 'MyString' }
    remarks { 'MyString' }
    user
    item_category
  end
end
