class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
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
      flash[:alert] = "Collection has not been created."
      render 'new'
    end
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.update_attributes(params[:collection])
      flash[:notice] = "Collection has been updated."
      redirect_to @collection
    else
      flash[:alert] = "Collection has not been updated."
      render "edit"
    end
  end
end
