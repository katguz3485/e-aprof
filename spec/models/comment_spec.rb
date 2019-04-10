# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end

  describe 'associations' do
    it { should belong_to :commentable }
    it { should belong_to :user }
  end

  describe 'db_columns' do
    it { should have_db_column :description }
    it { should have_db_column :title }
  end
end
