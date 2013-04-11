require 'spec_helper'

feature "Deleting Collections - " do
  scenario "Deleting a Collection" do
    FactoryGirl.create(:collection, name: "Stuff")
    visit '/'
    click_link "Stuff"
    click_link "Delete Collection"
    page.should have_content("Collection has been deleted.")
    visit '/'
    page.should_not have_content("Junk")
  end
end
