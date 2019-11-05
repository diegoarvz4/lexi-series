class Term < ApplicationRecord
  belongs_to :glosary
  validates :src_term, presence: true
  validates :dst_term, presence: true
end
