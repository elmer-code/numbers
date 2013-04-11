class CollectionsController < ApplicationController
  before_filter :find_collection, only: [:show, :edit, :update, :destroy]



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
  end

  def edit
  end

  def update
    if @collection.update_attributes(params[:collection])
      flash[:notice] = "Collection has been updated."
      redirect_to @collection
    else
      flash[:alert] = "Collection has not been updated."
      render "edit"
    end
  end

  def destroy
    @collection.destroy
    flash[:notice] = "Collection has been deleted."
    redirect_to collections_path
  end

  private

  def find_collection
    @collection = Collection.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Collection not found."
      redirect_to collections_path
  end
end
