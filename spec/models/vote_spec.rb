require 'rails_helper'
require 'faker'
require 'support/factory_bot'

RSpec.describe Vote, type: :model do
  describe 'Create a vote' do
    let(:testuser) { create(:uservote) }
    let(:testarticle) { build :article }
    let!(:vote) { build :vote }

    it 'change the count of votes by one' do
      testarticle.author_id = testuser.id
      testarticle.save
      vote.user_id = testuser.id
      vote.article_id = testarticle.id
      expect { vote.save }.to change { Vote.count }.by(1)
    end

    it 'return user id' do
      testarticle.author_id = testuser.id
      testarticle.save
      vote.user_id = testuser.id
      vote.article_id = testarticle.id
      vote.save
      expect(vote.user_id).to eq(testuser.id)
    end

    it 'will not return testuser id' do
      expect(vote.user_id).to_not eq(testuser.id)
    end
  end

  describe 'Vote associations' do
    it 'belongs to user' do
      vote = Vote.reflect_on_association(:user)
      expect(vote.macro).to eq(:belongs_to)
    end
    it 'velongs to article' do
      vote = Vote.reflect_on_association(:article)
      expect(vote.macro).to eq(:belongs_to)
    end
  end
end
