require 'rails_helper'
require 'faker'
require 'support/factory_bot'

RSpec.describe 'Artcicle create', type: :feature do
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
    fill_in 'article_text', with: Faker::Lorem.paragraph_by_chars(number: 1650, supplemental: false)
    attach_file('article_image', "#{Rails.root}/spec/fixtures/img1.jpg")
    page.check(category.name.to_s)
    click_button 'Create Article'
    expect(page).to have_content('Article has been created.')
  end

  scenario 'Fail creating an article, invalid number of characters in the text' do
    click_on 'Write an Article'
    fill_in 'article_title', with: 'This is a new article for testing.'
    fill_in 'article_text', with: Faker::Lorem.paragraph_by_chars(number: 50, supplemental: false)
    attach_file('article_image', "#{Rails.root}/spec/fixtures/img1.jpg")
    page.check(category.name.to_s)
    click_button 'Create Article'
    expect(page).to have_content('Text is too short (minimum is 1600 characters)')
  end

  scenario 'Fail creating an article, not choose a category' do
    click_on 'Write an Article'
    fill_in 'article_title', with: 'This is a new article for testing.'
    fill_in 'article_text', with: Faker::Lorem.paragraph_by_chars(number: 1650, supplemental: false)
    attach_file('article_image', "#{Rails.root}/spec/fixtures/img1.jpg")
    click_button 'Create Article'
    expect(page).to have_content('Article has not been created, missing category')
  end
end
