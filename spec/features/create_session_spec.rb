require 'rails_helper'
require 'faker'
require 'support/factory_bot'

RSpec.describe 'Session create and delete', type: :feature do
  let(:user) { create :user }

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
