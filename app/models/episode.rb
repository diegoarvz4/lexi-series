class Episode < ApplicationRecord
  belongs_to :series
  validates :number, presence: true, uniqueness: { scope: :series_id }
  validates :resume, presence: true
  has_one :translation
end
