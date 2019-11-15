class CharacterImage < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :character
  validates :picture, presence: true
end
