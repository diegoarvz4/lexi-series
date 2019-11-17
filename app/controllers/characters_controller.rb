class CharactersController < ApplicationController
  
  def index
    @series = Series.find_by(id: params[:series_id])
    @characters = @series.characters
  end

  def new
    @character = Character.new
    @series = Series.find_by(id: params[:series])
    @name = nil
    if params[:character]
      @name = params[:character]
    end
  end

  def edit
    @character = Character.find_by(id: params[:id])
    @series = Series.find_by(id: params[:series])
  end

  def update
    @character = Character.find_by(id: params[:id])
    @character.assign_attributes(character_params)
    @character.assign_attributes(naming: params[:character][:naming].upcase)
    if @character.save 
      flash.notice = "#{@character.name} Updated!"
      redirect_to @character
    else
      render 'edit'
    end
  end

  def create
    @series = Series.find_by(id: params[:character][:series_id])
    @character = @series.characters.build(character_params)
    if @character.save 
      redirect_to @character
    else
      render 'new'
    end
  end

  def delete
  end

  def show
    @character = Character.find_by(id: params[:id])
    @series = @character.series
    @characters_related = @character.relationships.map{|relationship| relationship.related} # (&:related)
    @characters_related += @character.inverse_relationships.map{|relationship| relationship.character}
    @characters_related.sort_by{ |character| character.name}
    @character_imgs = @character.character_images
  end

  private 

    def character_params
      params.require(:character).permit(:name, :description, :picture, :naming, :catch_phrases)
    end 
end
