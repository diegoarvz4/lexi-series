class CharactersController < ApplicationController
  
  def index
    @series = Series.find_by(id: params[:series_id])
    @characters = @series.characters
    @character = Character.new
  end

  def characters_search
    @series = Series.find_by(id: params[:series_id])
    @characters_search = []
    if params[:query].blank?
      @characters_search = @series.characters
    else
      @characters_words = params[:query].split(" ")
      @series.characters.each do |character|
        @characters_words.each do |word|
          if character.name.downcase.match(/#{word.downcase}/)
            @characters_search << character
          end
        end
      end

      @series.character_tags.each do |tag|
        @characters_words.each do |word|
          if tag.content.match(/#{word}/)
            @characters_search += tag.characters
          end
        end
      end

      @characters_search.uniq!
    end
    
    respond_to do |format|
      format.js
    end
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
    @character_tag = CharacterTag.new
    @character_tags = @character.character_tags
  end

  private 

    def character_params
      params.require(:character).permit(:name, :description, :picture, :naming, :treatment, :catch_phrases)
    end 
end
