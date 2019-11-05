class Series < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :episodes
  has_many :characters
  validates :name, presence: true
  validates :description, presence: true
  has_and_belongs_to_many :users
  has_many :glosaries
end
