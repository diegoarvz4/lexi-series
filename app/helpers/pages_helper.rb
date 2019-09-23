module PagesHelper

  def series_invitation(series_id)
    Series.find_by(id: series_id)
  end

  def not_confirmed(series_invitations)
    series_invitations.any? { |invitation| !invitation.confirmed }
  end
end
