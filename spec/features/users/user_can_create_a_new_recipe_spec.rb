require 'rails_helper'

feature 'User attempts to log in' do
  let!(:user) { User.create(name: "Waylon Jennings", email: 'waylon@music.com', password: 'password') }
  before do
    visit root_path
    visit root_path
    click_on 'Log in'
    fill_in 'user[email]', with: 'waylon@music.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Log me in!'
  end

  context 'when a visitor visits their profile' do
    scenario 'the user can create a new recipe' do
      click_on "Create a Recipe"

      expect(page).to have_current_path(new_recipe_path)

      fill_in 'recipe[name]', with: 'grilled cheese'
      fill_in 'recipe[description]', with: 'best sandwich ever'
      click_on 'Create Recipe'

      expect(page).to have_current_path(profile_path)

      click_on "View Recipe"

      expect(page).to have_current_path(recipe_path(Recipe.last.id))
      expect(page).to have_content("grilled cheese")
      expect(page).to have_content("best sandwich ever")
    end
  end
end
