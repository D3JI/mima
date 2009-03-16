require 'RMagick'
class Photo < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  belongs_to :album, :counter_cache => true
  belongs_to :user, :counter_cache => true
  has_attachment :storage => :file_system,
    :max_size => 5.megabytes,
    :content_type => :image,
    :thumbnails => { :tiny => '80x80>', :thumb => '120x120>' },
    :processor => :Rmagick
   validates_as_attachment
end
