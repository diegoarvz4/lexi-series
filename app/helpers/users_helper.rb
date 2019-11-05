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

  def quality_controls?(user)
    !user.translations.select{|tra| tra.quality_control}.empty?
  end

  def average_effectiveness(user)
    return 0 if user.translations.empty?
    quality_controls = user.translations.select{|tra| tra.quality_control}.map{|tra| tra.quality_control}
    return 0 if quality_controls.empty?
    accumulative = quality_controls.map{|tra| tra.effectiveness}.reduce{|a, b| a + b}
    accumulative / quality_controls.length
  end
end
