require 'spec_helper'

feature "Editing Collections" do
  scenario "Updating a Collection with valid data" do
    FactoryGirl.create(:collection, name: "Stuff")
    visit '/'
    click_link "Stuff"
    click_link "Edit Collection"
    fill_in "Name", with: "Junk"
    click_button "Update Collection"
    page.should have_content("Collection has been updated.")
    page.should have_content("Junk")
  end

  scenario "Updating a Collection with invalid data" do
    FactoryGirl.create(:collection, name: "Stuff")
    visit '/'
    click_link "Stuff"
    click_link "Edit Collection"
    fill_in "Name", with: ""
    click_button "Update Collection"
    page.should have_content("Collection has not been updated.")
  end
end