# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090316050856) do

  create_table "albums", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.integer  "photos_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["user_id"], :name => "index_albums_on_user_id"

  create_table "entries", :force => true do |t|
    t.integer  "user_id"
    t.integer  "entry_category_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["entry_category_id"], :name => "index_entries_on_entry_category_id"
  add_index "entries", ["user_id"], :name => "index_entries_on_user_id"

  create_table "entry_categories", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "entries_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entry_categories", ["name"], :name => "index_entry_categories_on_name"
  add_index "entry_categories", ["user_id"], :name => "index_entry_categories_on_user_id"

  create_table "photos", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "album_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.boolean  "primary"
    t.boolean  "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["album_id"], :name => "index_photos_on_album_id"
  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "nike"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.integer  "score",           :default => 10
    t.string   "grade",           :default => "1"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "entries_count"
    t.integer  "albums_count"
    t.integer  "photos_count"
  end

  add_index "users", ["username"], :name => "index_users_on_username"

end
