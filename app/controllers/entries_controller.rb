class EntriesController < ApplicationController
  before_filter :find_collection

  def new
    @entry = @collection.entries.build
  end

  def create
    @current_total = nil
    if @collection.entries.present?
      @current_total = @collection.entries.last.total
      @entries = @collection.entries
      @last_entry_index = @entries.count - 1
    end

    @entry = @collection.entries.build(params[:entry])
    if @entry.save
      flash[:notice] = "Total updated."
      redirect_to @collection
    else
      flash[:alert] = "Total not updated."
      render 'collections/show'
    end
  end

  private

  def find_collection
    @collection = Collection.find(params[:collection_id])
  end
end
