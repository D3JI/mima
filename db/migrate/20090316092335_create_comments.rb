class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :user_id
      t.integer :entry_id
      t.integer :photo_id
      t.text :content
      t.timestamps
    end
    add_index :comments, :entry_id
    add_index :comments, :photo_id
    add_column :photos, :comments_count, :integer, :default => 0
    add_column :entries, :comments_count, :integer, :default => 0
  end

  def self.down
    drop_table :comments
  end
end
