class Glosary < ApplicationRecord
  belongs_to :series
  has_many :terms
  validates :title, presence: true, uniqueness: { scope: :series_id }
end
