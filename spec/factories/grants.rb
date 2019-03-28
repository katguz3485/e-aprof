# frozen_string_literal: true

FactoryBot.define do
  factory :grant, class: 'Grants' do
    grant_name { 'MyString' }
    grant_code { 'MyString' }
  end
end
