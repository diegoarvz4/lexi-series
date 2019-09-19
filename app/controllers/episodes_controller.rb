class EpisodesController < ApplicationController
  def new
    @episode = Episode.new
    @series = Series.find_by(id: params[:series])
  end

  def create
    @series = Series.find_by(id: params[:episode][:series_id])
    episode = @series.episodes.build(number: params[:episode][:number],resume: params[:episode][:resume])
    if episode.save 
      redirect_to episode
    else
      render 'new'   
    end 
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def show
    @episode = Episode.find_by(id: params[:id])
    @series = @episode.series
  end
end
