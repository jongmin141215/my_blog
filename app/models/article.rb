class Article < ActiveRecord::Base
  has_many :comments
  has_many :images
  mount_uploader :image, PictureUploader
end



