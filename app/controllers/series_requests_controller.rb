class SeriesRequestsController < ApplicationController
  def create
    series = Series.find_by(id: params[:series_id])
    receiver = User.find_by(id: params[:receiver_id])
    series_request = SeriesRequest.new(requester_id: current_user.id,
                                       receiver_id: receiver.id,
                                       series_id: series.id,
                                       confirmed: false)
    if series_request.save
      SeriesMailer.series_invitation(receiver, series).deliver_now
      flash.notice = "¡Invitación exitosa a serie
                     #{series.name} a #{receiver.username}!"
    else
      flash.alert = '¡El usuario ya ha sido invitado!'
    end
    redirect_to users_path
  end

  def edit
  end

  def update
    @series_request = SeriesRequest.find_by(id: params[:id])
    @series_request.confirmed = true
    series = Series.find_by(id: @series_request.series_id)
    if @series_request.save
      current_user.series << series
      flash.notice = "¡Bienvenida(o) a #{series.name}!"
      redirect_to users_path
    else
      render 'error'
    end
  end

  private

  def request_params
    params.permit(:receiver_id, :series_id)
  end
end
