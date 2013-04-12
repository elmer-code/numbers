require 'spec_helper'

feature "Creating Collections - " do
  before do
    visit '/'
    click_link 'New Collection'
  end

  scenario "Creating a Collection with valid data" do
    fill_in 'Name', with: "Junk"
    fill_in 'Description', with: "Things I need to get rid of."
    click_button 'Create Collection'
    page.should have_content("Collection has been created.")
  end

  scenario "Creating a Collection without a name" do
    click_button 'Create Collection'
    page.should have_content("Collection has not been created.")
    page.should have_content("Name can't be blank")
  end

  scenario "Add a nested Collection to a Collection" do
    fill_in 'Name', with: "Junk"
    fill_in 'Description', with: "Things I need to get rid of."
    click_button 'Create Collection'
    fill_in 'Name', with: "Electronics"
    click_button 'Add Nested Collection'
    page.should have_content("Junk")
    page.should have_content("Electronics")
  end
end
