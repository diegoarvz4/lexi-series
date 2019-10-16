class Role < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: { scope: :category }
end
