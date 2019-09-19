class Series < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :episodes
  has_many :characters
end
