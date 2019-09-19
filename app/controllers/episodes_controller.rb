class EpisodesController < ApplicationController
  def new
    @episode = Episode.new
    @series = Series.find_by(id: params[:series])
  end

  def create
    @series = Series.find_by(id: params[:episode][:series_id])
    episode = @series.episodes.build(episode_params)
    if episode.save 
      redirect_to episode
    else
      render 'new'   
    end 
  end

  def update
    @episode = Episode.find_by(id: params[:id])
    @episode.assign_attributes(episode_params)
    if @episode.save 
      flash[:success] = "Episode #{@episode.number} Updated!"
      redirect_to @episode
    else
      render 'new'
    end
  end

  def destroy
  end

  def edit
    @episode = Episode.find_by(id:params[:id])
  end

  def show
    @episode = Episode.find_by(id: params[:id])
    @series = @episode.series
  end

  private 

  def episode_params
    params.require(:episode).permit(:number, :resume)
  end 
end
