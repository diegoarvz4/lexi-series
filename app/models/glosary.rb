class Glosary < ApplicationRecord
  belongs_to :series
  has_many :terms, dependent: :delete_all
  validates :title, presence: true, uniqueness: { scope: :series_id }
end
