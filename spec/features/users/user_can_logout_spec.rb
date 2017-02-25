require 'rails_helper'

feature 'User can log out' do

 before do
   User.create(name: 'Waylon Jennings', email:'waylon@music.com', password: 'password' )
 end

  context 'a user is logged in' do
    scenario 'a user should see a logout button' do
      visit root_path
      click_on 'Log in'
      fill_in 'user[email]', with: 'waylon@music.com'
      fill_in 'user[password]', with: 'password'
      click_on 'Log me in!'


      expect(page).to have_selector(:link_or_button, 'Logout')
    end

    scenario 'a user clicks on logout' do
      visit root_path
      click_on 'Log in'
      fill_in 'user[email]', with: 'waylon@music.com'
      fill_in 'user[password]', with: 'password'
      click_on 'Log me in!'

      click_on 'Logout'
      expect(page).to have_current_path(root_path)
      expect(page).to have_selector(:link_or_button, 'Log in')
    end
  end
end
