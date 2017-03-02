require 'rails_helper'

feature 'User attempts to create a new recipe' do
  before do
    logged_in_user
    get_to_recipes_path
  end

  context 'when a visitor visits their profile' do
    scenario 'the user can create a new recipe' do
      click_on "Create a Recipe"

      expect(page).to have_current_path(new_recipe_path)

      fill_in 'recipe[name]', with: 'grilled cheese'
      fill_in 'recipe[description]', with: 'best sandwich ever'
      click_on 'Create Recipe'

      expect(page).to have_current_path(recipes_path)

      within("#user-left") do
        click_link("Your Recipes")
      end
      expect(page).to have_current_path(recipes_path)

      click_on("View Recipe")

      expect(page).to have_current_path(recipe_path(Recipe.last.id))
      expect(page).to have_content("grilled cheese")
      expect(page).to have_content("best sandwich ever")
    end
  end

  context 'when a visitor visits their profile' do
    scenario 'the user leaves name out of a new recipe' do
      click_on "Create a Recipe"

      expect(page).to have_current_path(new_recipe_path)

      fill_in 'recipe[description]', with: 'best sandwich ever'
      click_on 'Create Recipe'

      expect(page).to have_current_path(new_recipe_path)

      expect(page).to have_content("Missing information for your recipe please try again.")
      expect(page).not_to have_content("grilled cheese")
      expect(page).not_to have_content("best sandwich ever")
    end
  end

  context 'when a visitor visits their profile' do
    scenario 'the user leaves description out of a new recipe' do
      click_on "Create a Recipe"

      expect(page).to have_current_path(new_recipe_path)

      fill_in 'recipe[name]', with: 'grilled cheese'
      click_on 'Create Recipe'

      expect(page).to have_current_path(new_recipe_path)


      expect(page).to have_content("Missing information for your recipe please try again.")
      expect(page).not_to have_content("grilled cheese")
      expect(page).not_to have_content("best sandwich ever")
    end
  end
end
