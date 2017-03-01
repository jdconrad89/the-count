require 'rails_helper'

feature 'User adds ingredient to their recipe' do

  before do
    logged_in_user
    create_a_recipe
  end

  context 'when a visitor visits their their recipe page' do
    scenario "they can add an ingredient to their" do

      within("#user-left") do
        click_link("Your Recipes")
      end
      click_on "View Recipe"
      expect(page).to have_current_path(recipe_path(Recipe.last.id))

      fill_in "q", with: "white bread"
      click_on "search"

      within first("#food_item") do
        click_on "Add to Recipe"
      end

      expect(page).to have_current_path(recipe_path(Recipe.last.id))
      expect(page).to have_content("White Bread - 1 slice, large")
    end
  end
end
