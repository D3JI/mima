class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.integer :photos_count, :default => 0
      t.timestamps
    end
    add_index :albums, :user_id
    add_column :users, :albums_count, :integer
  end

  def self.down
    drop_table :albums
  end
end
