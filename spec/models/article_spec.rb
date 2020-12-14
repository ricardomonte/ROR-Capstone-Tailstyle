require 'rails_helper'
require 'faker'
require 'support/factory_bot'

RSpec.describe Article, type: :model do
  describe 'Create an article' do
    let(:testuser) { create :user }
    !let(:testarticle) { build :article }

    it 'change the count of article by one' do
      testarticle.author_id = testuser.id
      expect { testarticle.save }.to change { Article.count }.by(1)
    end

    it 'will not return the author id' do
      testarticle.save
      expect(testarticle.author_id).to_not eq(testuser.id)
    end
  end

  describe 'Article associations' do
    it 'belongs to user' do
      article = Article.reflect_on_association(:user)
      expect(article.macro).to eq(:belongs_to)
    end
    it 'has many votes' do
      article = Article.reflect_on_association(:votes)
      expect(article.macro).to eq(:has_many)
    end

    it 'has many received_votes' do
      article = Article.reflect_on_association(:received_votes)
      expect(article.macro).to eq(:has_many)
    end

    it 'has and belongs to many categories' do
      article = Article.reflect_on_association(:categories)
      expect(article.macro).to eq(:has_and_belongs_to_many)
    end
  end
end
