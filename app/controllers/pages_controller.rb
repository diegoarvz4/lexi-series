class PagesController < ApplicationController
 def home
   @series = current_user.series
   @series_invitations = current_user.series_invitations
 end
end
