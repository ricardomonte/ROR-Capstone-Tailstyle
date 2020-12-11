require 'rails_helper'
require 'faker'

RSpec.describe Article, type: :model do
  describe 'Create an article' do
    let(:testuser) { User.create(username: 'carloncho', name: 'Carlos', email: 'carlos@microverse.org', password: '123456789') }
    
    uploader = ImageUploader.new(:store)
    file = File.new(Rails.root.join('test/files/img7.jpg'))
    uploaded_file = uploader.upload(file)

    subject {Article.create( title: Faker::Lorem.sentence, 
                            text: Faker::Lorem.paragraph, 
                            author_id: testuser.id, 
                            image_data: uploaded_file.to_json )}

    it 'change the count of votes by one' do
      expect { subject }.to change { Article.count }.by(1)
    end

    it 'return the author id' do
      expect(subject.author_id).to eq(testuser.id)
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
