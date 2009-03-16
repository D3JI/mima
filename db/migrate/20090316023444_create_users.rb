class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :nike
      t.string :email
      t.string :hashed_password
      t.string :salt
      t.integer :score, :default => 10
      t.string :grade, :default => 1
      t.timestamps
    end
    add_index :users, :username
  end

  def self.down
    drop_table :users
  end
end
