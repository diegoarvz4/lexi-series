class CharacterTag < ApplicationRecord
  has_and_belongs_to_many :characters
  belongs_to :series
  validates :content, presence: true
end
