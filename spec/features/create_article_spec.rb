require 'rails_helper'
require 'faker'
require 'support/factory_bot'

RSpec.describe 'Session create and delete', type: :feature do
  let(:user) { create :user }
  let!(:category) { create :category }

  before(:example) do
    visit login_path
    fill_in 'session_username', with: user.username
    click_button 'Login'
  end

  scenario 'Create an article' do
    click_on 'Write an Article'
    fill_in 'article_title', with: 'This is a new article for testing.'
    fill_in 'article_text', with: 'This is a new text for the article for testing.'
    attach_file("article_image", Rails.root + "spec/fixtures/img1.jpg")
    page.choose("#{category.name}")
    click_button 'Create Article'
    expect(page).to have_content('Article has been created.')
    
  end
end