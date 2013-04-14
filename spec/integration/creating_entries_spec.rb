require 'spec_helper'

feature "Creating Entries - " do
  before do
    FactoryGirl.create(:collection, name: "Junk")
    visit '/'
    click_link "Junk"
  end

  scenario "Creating an Entry with a valid total" do
    fill_in "entry_total", with: "1"
    click_button "Update Total"
    page.should have_content("Total updated.")
    page.should have_content("1");
  end

  scenario "Creating an Entry with no total" do
    click_button "Update Total"
    page.should have_content("Total not updated.")
    # @entry vs Entry.new in forms. Using @entry will show errors on all
    #   of the nested forms.
    # page.should have_content("Total can't be blank")
  end
end
