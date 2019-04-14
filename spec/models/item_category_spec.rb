# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
  describe 'associations' do
    it { should belong_to :purchase_order }
    it { should have_many :items }
  end

  describe 'db_columns' do
    it { should have_db_column :purchase_order_id }
    it { should have_db_column :name }
  end
end
