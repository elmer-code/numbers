require 'spec_helper'

feature "Creating Entries - " do
  before do
    FactoryGirl.create(:collection, name: "Junk")
    visit '/'
    click_link "Junk"
    click_link "Update Total"
  end

  scenario "Creating an Entry with a valid total" do
    fill_in "Total", with: "1"
    click_button "Update Total"
    page.should have_content("Total updated.")
    page.should have_content("1");
  end

  scenario "Creating an Entry with no total" do
    click_button "Update Total"
    page.should have_content("Total not updated.")
    page.should have_content("Total can't be blank")
  end
end
