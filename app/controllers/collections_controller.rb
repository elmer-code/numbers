class CollectionsController < ApplicationController
  before_filter :find_collection, only: [:show, :edit, :update, :destroy]

  def index
    @collections = Collection.where(ancestry: nil)
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(params[:collection])
    if @collection.save
      flash[:notice] = "Collection has been created."
      redirect_to @collection.root # when using xhr, .root can be removed
    else
      flash.now[:alert] = "Collection has not been created."
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
      redirect_to @collection.root
    else
      flash.now[:alert] = "Collection has not been updated."
      render "edit"
    end
  end

  def destroy
    parent_id = @collection.parent_id

    @collection.update_ancestors_numbers!(-@collection.number)
    @collection.destroy
    flash[:notice] = "Collection has been deleted."

    if parent_id == nil
      redirect_to collections_path
    else
      redirect_to Collection.find(parent_id).root
    end
  end

  private

  def find_collection
    @collection = Collection.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Collection not found."
      redirect_to collections_path
  end
end
