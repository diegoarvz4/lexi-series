class EpisodesController < ApplicationController
  def new
    @episode = Episode.new
    @series = Series.find_by(id: params[:series])
  end

  def create
    @series = Series.find_by(id: params[:episode][:series_id])
    @episode = @series.episodes.build(episode_params)
    if @episode.save 
      flash.notice = '¡Episodio agregado!'
      redirect_to @episode
    else
      render 'new'
    end 
  end

  def update
    @episode = Episode.find_by(id: params[:id])
    @episode.assign_attributes(episode_params)
    if @episode.save 
      flash.notice = "Episode #{@episode.number} Updated!"
      redirect_to @episode
    else
      render 'edit'
    end
  end

  def destroy
  end

  def edit
    @episode = Episode.find_by(id: params[:id])
  end

  def show
    @episode = Episode.find_by(id: params[:id])
    @series = @episode.series
    @translation = @episode.translation
    @qc = @translation.quality_control
  end

  def index
    redirect_to request.referrer
  end

  private 

  def episode_params
    params.require(:episode).permit(:number, :resume)
  end 
end
