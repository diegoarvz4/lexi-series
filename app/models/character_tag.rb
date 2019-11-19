class CharacterTag < ApplicationRecord
  belongs_to :character
  belongs_to :series
end
