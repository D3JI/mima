class EntryCategory < ActiveRecord::Base
  has_many :entries, :dependent => :destroy
  belongs_to :user
end
