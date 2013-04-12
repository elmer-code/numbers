class AddAncestryToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :ancestry, :string

    add_index :collections, :ancestry
  end
end
