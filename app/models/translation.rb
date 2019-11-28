class Translation < ApplicationRecord
  belongs_to :episode
  belongs_to :translator, class_name: 'User'
  has_one :quality_control, dependent: :delete
  validates :duedate, presence: true
  validates :files_url, format: {with: /\Ahttps:\/\//, message: ": Url debe empezar con https://"}
  validates :video_url, format: {with: /\Ahttps:\/\//, message: ": Url debe empezar con https://"}
end
