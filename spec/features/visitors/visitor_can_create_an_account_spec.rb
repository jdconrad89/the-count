require 'rails_helper'

feature 'Visitor creates an account' do

  before { visit root_path }

  context 'when a visitor visits the root' do
    scenario 'the user should see a sign up button' do
      expect(page).to have_selector(:link_or_button, 'Sign Up')
    end
  end

  context 'when a user clicks on sign up' do
    before { click_on 'Sign Up'}
    scenario 'the user should be redirected to /signup' do

      expect(page).to have_current_path('/signup')
    end

    scenario 'the user should see a sign up form' do
      expect(page).to have_content('Have an account?')
      expect(page).to have_selector(:link_or_button, 'Log in')
      expect(page).to have_selector(:link_or_button, 'Log in with Facebook')
      expect(page).to have_field(:user_name)
      expect(page).to have_field(:user_email)
      expect(page).to have_field(:user_password)
      expect(page).to have_field(:user_password_confirmation)
      expect(page).to have_selector(:link_or_button, 'Sign me up!')
    end
  end

  scenario 'the user creates an new account' do
    visit new_user_path
    valid_user_creation
    expect(User.count).to eq(1)
    expect(page).to have_current_path('/profile')
  end

  context 'when a visitor provides invalid information' do
    scenario 'they see are redirected and see a flash message' do
      visit new_user_path
      invalid_user_creation


      expect(User.count).to eq(0)
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content('Failed to create an account, please try again.')
    end
  end
end

def valid_user_creation
  fill_in 'user[name]', with: 'Waylon Jennings'
  fill_in 'user[email]', with: 'waylon@music.com'
  fill_in 'user[password]', with: 'honky'
  fill_in 'user[password_confirmation]', with: 'honky'
  click_on 'Sign me up!'
end

def invalid_user_creation
  fill_in 'user[email]', with: 'waylon@music.com'
  fill_in 'user[password]', with: 'honky'
  fill_in 'user[password_confirmation]', with: 'hony'
  click_on 'Sign me up!'
end
