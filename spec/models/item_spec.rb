# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do

  describe 'associations' do
    it {should belong_to :user}
    it {should belong_to :item_category}
  end

  describe 'db_columns' do
    it {should have_db_column :type}
    it {should have_db_column :user_id}
    it {should have_db_column :item_category_id}
    it {should have_db_column :item_name}
    it {should have_db_column :link}
    it {should have_db_column :item_price}
    it {should have_db_column :catalogue_number}
    it {should have_db_column :provider_name}
    it {should have_db_column :number_of_items}
    it {should have_db_column :packaging}
    it {should have_db_column :remarks}
  end

end
