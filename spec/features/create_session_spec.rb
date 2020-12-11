require 'rails_helper'
require 'faker'

RSpec.describe 'Session create and delete', type: :feature do
  let(:user) { User.create(username: 'jb', name: 'Johnny Bravo', email: 'johnny@microverse.org', password: '123456789') }

  uploader = ImageUploader.new(:store)
  file = File.new(Rails.root.join('test/files/img7.jpg'))
  uploaded_file = uploader.upload(file)

  let!(:article) {Article.create( title: Faker::Lorem.sentence, 
                          text: Faker::Lorem.paragraph, 
                          author_id: user.id, 
                          image_data: uploaded_file.to_json )}

  before(:example) do
    visit login_path
  end

  scenario 'Correct user login' do
    fill_in 'session_username', with: user.username
    click_button 'Login'
    expect(page).to have_content('Welcome to TailStyle')
  end

  scenario 'Incorrect user login' do
    fill_in 'session_username', with: 'rails'
    click_button 'Login'
    expect(page).to have_content('Wrong username')
  end

  scenario 'User logout' do
    fill_in 'session_username', with: user.username
    click_button 'Login'
    click_on 'Logout'
    expect(page).to have_content('Register')
  end
end