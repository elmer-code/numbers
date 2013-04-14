class EntriesController < ApplicationController
  before_filter :find_collection

  def new
    @entry = @collection.entries.build
  end

  def create
    @entry = @collection.entries.build(params[:entry])
    if @entry.save

      @entry.collection.update_number!

      flash[:notice] = "Total updated."
      redirect_to @collection.root
    else
      flash.now[:alert] = "Total not updated."
      render 'collections/show'
    end
  end

  private

  def find_collection
    @collection = Collection.find(params[:collection_id])
  end
end
