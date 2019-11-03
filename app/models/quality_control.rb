class QualityControl < ApplicationRecord
  belongs_to :reviewer, class_name: 'User'
  belongs_to :translation
end
