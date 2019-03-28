# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Grant, type: :model do
  subject { FactoryBot.build(:grant) }

  describe 'validations' do
    it {should validate_presence_of :grant_code}
    it {should validate_presence_of :grant_name}
  end

  describe 'associations' do
    it {should have_many :purchase_orders}
  end

  describe 'db_columns' do
    it {should have_db_column :grant_name}
    it {should have_db_column :grant_code}
  end


end
