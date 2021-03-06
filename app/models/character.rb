class Character < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :series
  # belongs_to :dubcard
  has_many :relationships, dependent: :delete_all
  has_many :inverse_relationships,
           class_name: 'Relationship',
           foreign_key: 'related_id', dependent: :delete_all
  validates :name, uniqueness: true, presence: true
  has_many :character_images, dependent: :delete_all
  has_and_belongs_to_many :character_tags, delete_all: :delete_all
end
