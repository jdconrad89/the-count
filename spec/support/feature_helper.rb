module FeatureHelper

  def logged_in_user
    User.create(name: "Waylon Jennings", email: 'waylon@music.com', password: 'password')

    visit root_path
    click_on 'Log in'
    fill_in 'user[email]', with: 'waylon@music.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Log me in!'
  end

  def create_a_recipe
    click_on "Create a Recipe"
    fill_in 'recipe[name]', with: 'grilled cheese'
    fill_in 'recipe[description]', with: 'best sandwich ever'
    click_on 'Create Recipe'
  end

end
