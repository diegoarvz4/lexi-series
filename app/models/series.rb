class Series < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :episodes
end
