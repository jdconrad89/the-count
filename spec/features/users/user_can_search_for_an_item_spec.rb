require 'rails_helper'

describe "item search" do
  before do
    User.create(name: 'Waylon Jennings', email:'waylon@music.com', password: 'password' )
    visit root_path
    click_on 'Log in'
    fill_in 'user[email]', with: 'waylon@music.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Log me in!'
    visit root_path
  end

  it " user can search for stores by a specific item" do
    search = "Apple"

    visit root_path
    fill_in "q", with: search
    click_on "search"

    expect(current_path).to eq("/search")
    expect(page).to have_content(search)

    expect(page).to have_content("Name")
    expect(page).to have_content("Brand")
    expect(page).to have_content("Calories")
    expect(page).to have_content("Fat")
    expect(page).to have_content("Serving Size")
  end
end
