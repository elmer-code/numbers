require 'spec_helper'

feature "Creating Entries - " do
  before do
    @junk_collection = FactoryGirl.create(:collection, name: "Junk")
    @junk_collection.children.create(name: "Electronics")
    visit '/'
    click_link "Junk"
  end

  scenario "Creating an Entry with a valid total" do
    fill_in "uncategorized_total_Junk", with: "1"
    click_button "Update uncategorized total Junk"
    page.should have_content("Total updated.")
    within('.collection_number') do
      page.should have_content("1")
    end
    page.should have_content("1");
  end

  scenario "Creating an Entry with no total" do
    click_button "Update uncategorized total Junk"
    page.should have_content("Total not updated.")
    # @entry vs Entry.new in forms. Using @entry will show errors on all
    #   of the nested forms.
    # page.should have_content("Total can't be blank")
  end

  scenario "Creating an entry in a nested Collection" do
    fill_in "uncategorized_total_Junk", with: "1"
    click_button "Update uncategorized total Junk"
    page.should have_content("Total updated.")
    within('.collection_number') do
      page.should have_content("1")
    end
    page.should have_content("1");

    fill_in "uncategorized_total_Electronics", with: "10"
    click_button "Update uncategorized total Electronics"
    page.should have_content("Total updated.")

    within('.collection_number') do
      page.should have_content("11")
    end
  end
end
