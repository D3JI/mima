class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :parent_id
      t.integer :album_id
      t.integer :user_id
      t.string :title
      t.text :description

      t.string  :content_type
      t.string  :filename
      t.string  :thumbnail
      t.integer :size
      t.integer :width
      t.integer :height
      t.boolean :primary
      t.boolean :avatar

      t.timestamps
    end
    add_index :photos, :user_id
    add_index :photos, :album_id
  end


  def self.down
    drop_table :photos
  end
end
