require 'rails_helper'

feature 'User attempts to log in' do
  let!(:user) { User.create(name: "Waylon Jennings", email: 'waylon@honky.com', password: 'honky') }
  before do
    visit root_path
    click_on 'Log in'
  end

  context 'when a user visits the root path' do
    scenario 'the user clicks on log in' do
      expect(page).to have_current_path('/login')
    end

    scenario 'after logging in the user should be redirected to their homepage' do
      manual_login
      expect(page).to have_current_path('/profile')
    end
  end

  context 'when a user provides invalid credentials' do
    scenario 'they provide invalid username and see invalid login message ' do
      invalid_username
      expect(page).to have_current_path(new_session_path)
      expect(page).to have_content("Login failed, please try again.")
    end

    scenario 'they provide invalid password and see invalid login message' do
      invalid_password
      expect(page).to have_current_path(new_session_path)
      expect(page).to have_content("Login failed, please try again.")
    end

    scenario 'they do not provide a username or password and see invalid login message' do
      blank_username_and_password
      expect(page).to have_current_path(new_session_path)
      expect(page).to have_content("Login failed, please try again.")
    end
  end

  def manual_login
    fill_in 'user[email]', with: 'waylon@honky.com'
    fill_in 'user[password]', with: 'honky'
    click_on 'Log me in!'
  end

  def invalid_username
    fill_in 'user[email]', with: 'way@honky.com'
    fill_in 'user[password]', with: 'honky'
    click_on 'Log me in!'
  end

  def invalid_password
    fill_in 'user[email]', with: 'waylon@honky.com'
    fill_in 'user[password]', with: 'honk'
    click_on 'Log me in!'
  end

  def blank_username_and_password
    click_on 'Log me in!'
  end
end
