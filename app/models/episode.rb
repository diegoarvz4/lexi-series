class Episode < ApplicationRecord
  belongs_to :series
  validates :number, presence: true, uniqueness: true
  validates :resume, presence: true
end
