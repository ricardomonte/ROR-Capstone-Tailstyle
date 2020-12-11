require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Create a user' do
    subject { User.create(username: 'carloncho', name: 'Carlos', email: 'carlos@microverse.org', password: '123456789') }

    it 'change the count of users by one' do
      expect { subject }.to change { User.count }.by(1)
    end
    it 'return Carlos' do
      expect(subject.username).to eq('carloncho')
    end

    it 'it dont return Pedro' do
      expect(subject.name).to_not eq('Pedro')
    end

    it 'email have email format' do
      expect(subject.email).to match(/[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/)
    end

    it 'email will not have other format' do
      expect(subject.email).to_not match(/^[a-z0-9_-]{3,15}$/)
    end
  end

  describe 'User associations' do
    it 'have many articles' do
      user = User.reflect_on_association(:articles)
      expect(user.macro).to eq(:has_many)
    end
    it 'have many votes' do
      user = User.reflect_on_association(:votes)
      expect(user.macro).to eq(:has_many)
    end
    it 'have many voted_articles' do
      user = User.reflect_on_association(:voted_articles)
      expect(user.macro).to eq(:has_many)
    end
  end
end
