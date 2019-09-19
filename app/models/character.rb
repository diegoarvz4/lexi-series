class Character < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :series
end
