class AddNumberToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :number, :integer, default: 0
  end
end
