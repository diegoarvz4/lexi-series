class Character < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :series

  has_many :relationships
  has_many :inverse_relationships,
           class_name: 'Relationship',
           foreign_key: 'related_id'
end
