class PagesController < ApplicationController
 def home
   @series = current_user.series
 end 
end
