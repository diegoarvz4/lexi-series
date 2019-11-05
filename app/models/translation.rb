class Translation < ApplicationRecord
  belongs_to :episode
  belongs_to :translator, class_name: 'User'
  has_one :quality_control
  validates :duedate, presence: true
end