class Article < ActiveRecord::Base
  belongs_to :blog
  has_many :comments
  has_many :images
  mount_uploader :image, PictureUploader
end


