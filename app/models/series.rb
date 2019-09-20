class Series < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :episodes
  has_many :characters
  validates :name, presence: true
  validates :description, presence: true
end
