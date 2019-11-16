class Series < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :episodes, dependent: :delete_all
  has_many :characters, dependent: :delete_all
  has_many :glosaries, dependent: :delete_all
  validates :name, presence: true
  validates :description, presence: true
  has_and_belongs_to_many :users
end
