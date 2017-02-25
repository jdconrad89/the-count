require 'rails_helper'

describe "item search" do
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
