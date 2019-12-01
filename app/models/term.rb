class Term < ApplicationRecord
  belongs_to :glosary
  validates :src_term, presence: true, uniqueness: { scope: :glosary_id }
  validates :dst_term, presence: true
end
