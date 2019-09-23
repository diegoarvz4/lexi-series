module UsersHelper

  def self.admin?
    admin
  end

  def invited?(receiver, series_id)
    SeriesRequest.find_by(receiver_id: receiver.id,
                         series_id: series_id,
                         confirmed: false)
  end

  def enrolled?(receiver, series_id)
    SeriesRequest.find_by(receiver_id: receiver.id,
      series_id: series_id, 
      confirmed: true)
  end

end
