class CollectionsController < ApplicationController
  def index
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(params[:collection])
    if @collection.save
      flash[:notice] = "Collection has been created."
      redirect_to @collection
    else
      # later
    end
  end

  def show
    @collection = Collection.find(params[:id])
  end
end
