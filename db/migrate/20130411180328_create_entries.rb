class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :total
      t.references :collection

      t.timestamps
    end
    add_index :entries, :collection_id
  end
end
