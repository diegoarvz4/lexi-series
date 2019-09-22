class SeriesRequestsController < ApplicationController
  def create
    series = Series.find_by(id: params[:series_id])
    receiver = User.find_by(id: params[:receiver_id])
    series_request = SeriesRequest.new(requester_id: current_user.id, 
                                       receiver_id: receiver.id, 
                                       series_id: series.id)
    if series_request.save
      flash[:success] = "¡Invitación a serie #{series.name} a #{receiver.username} exitosa!"
      redirect_to users_path
    else
      render 'error'
    end
    
    
  end

  def edit
  end

  def update
  end
end
