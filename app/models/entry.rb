class Entry < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  belongs_to :entry_category, :counter_cache => true
end
