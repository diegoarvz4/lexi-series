class Relationship < ApplicationRecord
  belongs_to :character
  belongs_to :related, class_name: 'Character'

  validates :character_id, uniqueness: { scope: :related_id }
  
end
