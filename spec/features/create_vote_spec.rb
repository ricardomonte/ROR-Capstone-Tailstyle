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
    click_on 'Write an Article'
    fill_in 'article_title', with: 'This is a new article for testing.'
    fill_in 'article_text', with: 'This is a new text for the article for testing.'
    attach_file('article_image', Rails.root + 'spec/fixtures/img1.jpg')
    page.choose(category.name.to_s)
    click_button 'Create Article'
    visit category_path(category.id)
  end

  scenario 'Vote for article' do
    page.find_by_id('vote').click
    expect(page).to have_content('Thank you for your vote')
  end
end
