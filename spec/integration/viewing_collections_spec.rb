require 'spec_helper'

feature "Viewing Collections" do
  scenario "Listing only root Collections" do
    collection_one = FactoryGirl.create(:collection, name: "Stuff")
    collection_two = FactoryGirl.create(:collection, name: "Books")
    nested         = FactoryGirl.create(:collection, name: "Nested",
                                                     parent_id: collection_one.id)
    visit '/'
    page.should have_link("Stuff", href: collection_path(collection_one))
    page.should have_link("Books", href: collection_path(collection_two))
    page.should_not have_link("Nested", href: collection_path(nested))
  end
end
