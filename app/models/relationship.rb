class Relationship < ApplicationRecord
  belongs_to :character
  belongs_to :related, class_name: 'Character'
end
