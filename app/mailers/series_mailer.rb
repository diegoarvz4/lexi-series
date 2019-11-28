class SeriesMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.series_mailer.series_invitation.subject
  #
  def series_invitation(user, series)
    @user = user
    @series = series
    mail to: user.email, subject: "Invitación a #{@series.name}"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.series_mailer.translation_assignment.subject
  #
  def translation_assignment
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.series_mailer.qc_revised.subject
  #
  def qc_revised
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
