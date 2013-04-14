require 'spec_helper'

feature "Creating Nested Collections - " do
  before do
    FactoryGirl.create(:collection, name: "Junk")
    visit '/'
    click_link 'Junk'
  end

  scenario "Create a nested Collection inside the root Collection" do
    fill_in 'Nested in Junk', with: "Electronics"
    click_button 'Add Collection inside Junk'
    page.should have_content("Junk")
    page.should have_content("Electronics")
  end

  scenario "Create a nested Collection inside a nested Collection" do
    fill_in 'Nested in Junk', with: "Electronics"
    click_button 'Add Collection inside Junk'
    fill_in 'Nested in Electronics', with: "Monitors"
    click_button 'Add Collection inside Electronics'
    page.should have_content("Junk")
    page.should have_content("Electronics")
    page.should have_content("Monitors")
  end
end
