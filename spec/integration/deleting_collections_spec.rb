require 'spec_helper'

feature "Deleting Collections - " do
  before do
    @junk_collection = FactoryGirl.create(:collection, name: "Junk")
    @junk_collection.children.create(name: "Electronics")
    visit '/'
    click_link "Junk"
  end

  scenario "Deleting a root Collection" do
    click_link "Delete Junk"
    page.should have_content("Collection has been deleted.")
    page.should_not have_content("Junk")
    current_url.should == collections_url
  end

  scenario "Deleting a nested Collection" do
    fill_in "uncategorized_total_Junk", with: "1"
    click_button "Update uncategorized total Junk"
    fill_in "uncategorized_total_Electronics", with: "10"
    click_button "Update uncategorized total Electronics"

    page.should have_content("Total updated.")
    within('.collection_number') do
      page.should have_content("11")
    end

    click_link "Delete Electronics"
    within('.collection_number') do
      page.should have_content("1")
    end

    current_url.should == collection_url(@junk_collection)
  end
end
