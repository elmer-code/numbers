require 'spec_helper'

feature "Creating Collections - " do
  before do
    visit '/'
    click_link 'New Collection'
  end

  scenario "Creating a collection with valid data" do
    fill_in 'Name', with: "Change"
    fill_in 'Description', with: "Metallic money"
    click_button 'Create Collection'
    page.should have_content("Collection has been created.")
  end

  scenario "Creating a collection without a name" do
    click_button 'Create Collection'
    page.should have_content("Collection has not been created.")
    page.should have_content("Name can't be blank")
  end
end
