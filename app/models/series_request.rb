class SeriesRequest < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  validates :receiver_id, uniqueness: { scope: :series_id }
  # validate :sent?

  def sent?
    if SeriesRequest.where(series_id: series_id,
                           receiver_id: receiver_id,
                           requester_id: requester_id).exists?
      errors.add(:series_request, 'Invitation already sent!')
    end
  end
end
