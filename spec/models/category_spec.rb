require 'rails_helper'
require 'faker'
require 'support/factory_bot'

RSpec.describe Category, type: :model do
  describe 'Create a Category' do
    subject { create :category }

    it 'change the count of users by one' do
      expect { subject }.to change { Category.count }.by(1)
    end

    it 'return priority' do
      expect(subject.priority).to eq(3)
    end

    it 'will not return priority' do
      expect(subject.priority).to_not eq(6)
    end
  end

  describe 'Category associations' do
    it 'has and belongs to many articles' do
      category = Category.reflect_on_association(:articles)
      expect(category.macro).to eq(:has_and_belongs_to_many)
    end
  end
end
