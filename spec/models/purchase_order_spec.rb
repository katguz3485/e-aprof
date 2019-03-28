require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  subject {FactoryBot.build(:purchase_order)}


  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'associations' do
    it {should have_many :comments}
    it {should have_many(:users).through(:comments)}
    it {should have_many :item_categories}
    it {should have_many(:items).through(:item_categories)}
    it {should belong_to :grant}
  end

  describe 'db_columns' do
    it {should have_db_column :name}
    it {should have_db_column :grant_id}
  end


end
