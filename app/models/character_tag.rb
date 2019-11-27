class CharacterTag < ApplicationRecord
  has_and_belongs_to_many :characters
  belongs_to :series
  validates :content, presence: true, format: {with: /\A\#\S*\z/, message: ": Usa un hash tag válido (#HashTag)"}
end
