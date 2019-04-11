# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'associations' do
    it { should have_many :user_orders }
    it { should have_many(:purchase_orders).through(:user_orders) }
    it { should have_many :comments }
  end
end
