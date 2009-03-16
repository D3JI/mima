class CreateEntryCategories < ActiveRecord::Migration
  def self.up
    create_table :entry_categories do |t|
      t.string :name
      t.integer :user_id
      t.integer :entries_count, :default => 0
      t.timestamps
    end
    add_index :entry_categories, :name
    add_index :entry_categories, :user_id
  end

  def self.down
    drop_table :entry_categories
  end
end
