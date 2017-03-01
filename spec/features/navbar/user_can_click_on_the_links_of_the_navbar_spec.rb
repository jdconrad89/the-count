require 'rails_helper'

RSpec.feature "When a user clicks on the links in the nav bar it takes you to the expected page", type: :feature do
  context "as a guest" do
    it "guest clicks on the Log in button in the navbar" do
      visit root_path

      within("#guest-right") do
        click_link("Log in")
      end
      expect(current_path).to eq(new_session_path)
    end

    it "guest clicks on the Sign Up button in the navbar" do
      visit root_path

      within("#guest-right") do
        click_link("Sign Up")
      end
      expect(current_path).to eq(new_user_path)
    end

    it "guest clicks on the home button in the navbar" do
      visit new_session_path

      within("#guest-left") do
        click_link("Home")
      end
      expect(current_path).to eq(root_path)
    end
  end

  context "when a user is logged in it sees different buttons in the navbar" do
    before do
      logged_in_user
    end

    it "user clicks on the logout button in the navbar" do
      visit root_path

      within("#user-right") do
        click_link("Logout")
      end
      expect(current_path).to eq(root_path)
    end

    it "user clicks on the profile button in the navbar" do
      visit root_path

      within("#user-left") do
        click_link("Profile")
      end

      expect(current_path).to eq(profile_path)
    end

    it "user clicks on the your recipes button in the navbar" do
      visit root_path

      within("#user-left") do
        click_link("Your Recipes")
      end

      expect(current_path).to eq(recipes_path)
    end
  end
end
