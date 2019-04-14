# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :purchase_order }
  end

  describe 'db_columns' do
    it { should have_db_column :user_id }
    it { should have_db_column :purchase_order_id }
  end
end
