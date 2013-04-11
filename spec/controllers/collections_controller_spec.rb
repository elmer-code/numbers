require 'spec_helper'

describe CollectionsController do
  it "displays an error for a missing collection" do
    get :show, id: "invalid-id"
    response.should redirect_to(collections_path)
    flash[:alert].should == "Collection not found."
  end
end
