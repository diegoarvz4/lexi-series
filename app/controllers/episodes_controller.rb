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
    @episode.assign_attributes(dubcard_characters: clean_characters)
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
    if @translation
      @qc = @translation.quality_control
    end
    @dubcard = @episode.dubcard_characters
  end

  def index
    redirect_to request.referrer
  end

  private 

  def episode_params
    params.require(:episode).permit(:number, :resume, :dubcard_characters)
  end

  def clean_characters
    dubcard_chars = params[:episode][:dubcard_characters]
    dubcard_chars.split(/\s\s+/)
    .uniq
    .reject{|ch| ch.downcase == 'personaje' || ch.downcase == 'inserto' || ch.downcase == 'ambiente'}
    .sort
    .join(',')
  end

end
