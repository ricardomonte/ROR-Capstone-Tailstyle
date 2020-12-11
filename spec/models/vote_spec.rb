require 'rails_helper'
require 'faker'

RSpec.describe Vote, type: :model do
  describe 'Create a vote' do
    let(:testuser) { User.create(username: 'carloncho', name: 'Carlos', email: 'carlos@microverse.org', password: '123456789') }
    let(:testuser2) { User.create(username: 'peterrr', name: 'Peter', email: 'peter@microverse.org', password: '123456') }
    uploader = ImageUploader.new(:store)
    file = File.new(Rails.root.join('test/files/img7.jpg'))
    uploaded_file = uploader.upload(file)

    let(:testarticle) {Article.create( title: Faker::Lorem.sentence, 
                                      text: Faker::Lorem.paragraph, 
                                      author_id: testuser2.id, 
                                      image_data: uploaded_file.to_json )}
    subject { Vote.create(user_id: testuser.id, article_id: testarticle.id) }

    it 'change the count of votes by one' do
      expect { subject }.to change { Vote.count }.by(1)
    end

    it 'return user id' do
      expect(subject.user_id).to eq(testuser.id)
    end

    it 'will not return testuser2 id' do
      expect(subject.user_id).to_not eq(testuser2.id)
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
