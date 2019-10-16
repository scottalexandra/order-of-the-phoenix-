require 'rails_helper'

describe "user can search for members" do
  scenario "by house" do
    # As a user,
    # When I visit "/"
    visit '/'
    # And I Select "Gryffindor" from the select field
    select "Gryffindor", from: :house
    # (Note: Use the existing select field)
    # And I click "Search For Members"
    click_on "Search For Members"
    # Then I should be on page "/search"
    expect(current_path).to eq(search_path)
    # Then I should see a total of the number of members for that house. (21 for Gryffindor)
    expect(page).to have_content("21 Members for Gryffindor")
    # Then I should see a list of 21 members
    #
    # And for each of the members I should see:
    within(first('.member')) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role")
      expect(page).to have_css(".house")
      expect(page).to have_css(".patronus")
    end
    # - The name of the member
    # - The members role (if it exists)
    # - The house the member belongs to
    # - The Patronus of the member (if it exists)
  end
end
