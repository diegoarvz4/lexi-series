# Preview all emails at http://localhost:3000/rails/mailers/series_mailer
class SeriesMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/series_mailer/series_invitation
  def series_invitation
    user = User.first
    series = Series.first
    SeriesMailer.series_invitation(user, series)
  end

  # Preview this email at http://localhost:3000/rails/mailers/series_mailer/translation_assignment
  def translation_assignment
    SeriesMailer.translation_assignment
  end

  # Preview this email at http://localhost:3000/rails/mailers/series_mailer/qc_revised
  def qc_revised
    SeriesMailer.qc_revised
  end

end
