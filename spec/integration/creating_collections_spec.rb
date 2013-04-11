require 'spec_helper'

feature "Creating a collection" do
  scenario "with valid data" do
    visit '/'
    click_link 'New Collection'
    fill_in 'Name', with: "Change"
    fill_in 'Description', with: "Metallic money"
    click_button 'Create Collection'
    page.should have_content("Collection has been created.")
  end
end
