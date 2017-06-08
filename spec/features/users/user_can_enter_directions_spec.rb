require 'rails_helper'

feature 'User adds ingredient to their recipe' do

  before do
    logged_in_user
    create_a_recipe
  end

  context 'when a visitor visits their their recipe page' do
    scenario "they can add an ingredient to their" do

      within("#user-left") do
        click_link("Recipe Box")
      end
      click_on "View Recipe"
      expect(page).to have_current_path(recipe_path(Recipe.last.id))

      fill_in "recipe[directions]", with: "Grilled Cheese is Amazing"
      click_on "Update Directions"

      expect(page).to have_current_path(recipe_path(Recipe.last.id))
      expect(page).to have_content("Grilled Cheese is Amazing")
    end
  end
end
