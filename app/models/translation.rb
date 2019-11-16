class Translation < ApplicationRecord
  belongs_to :episode
  belongs_to :translator, class_name: 'User'
  has_one :quality_control, dependent: :delete
  validates :duedate, presence: true
end
