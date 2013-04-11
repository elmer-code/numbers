require 'spec_helper'

feature "Viewing Collections" do
  scenario "Listing all Collections" do
    collection_one = FactoryGirl.create(:collection, name: "Stuff")
    collection_two = FactoryGirl.create(:collection, name: "Books")
    visit '/'
    page.should have_link("Stuff", href: collection_path(collection_one))
    page.should have_link("Books", href: collection_path(collection_two))
  end
end
