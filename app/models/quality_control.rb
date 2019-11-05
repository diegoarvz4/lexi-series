class QualityControl < ApplicationRecord
  belongs_to :reviewer, class_name: 'User'
  belongs_to :translation
  validates :feedback, presence: true
  validates :effectiveness, presence: true
  validates :final_score, presence: true
  validates :loops, presence: true
  validates :max_score, presence: true 
  validates :reduced_score, presence: true
  validates :grade, presence: true
end
