class CharactersController < ApplicationController
  def new
    @character = Character.new
    @series = Series.find_by(id: params[:series])
  end

  def edit
    @character = Character.find_by(id: params[:id])
    @series = Series.find_by(id: params[:series])
  end

  def update
    @character = Character.find_by(id: params[:id])
    @character.assign_attributes(character_params)
    if @character.save 
      flash.notice = "#{@character.name} Updated!"
      redirect_to @character
    else
      render 'new'
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
    @characters_related = @character.relationships.map{|relationship| relationship.related} # (&:related)
    @characters_related += @character.inverse_relationships.map{|relationship| relationship.character}
    @characters_related.sort_by{ |character| character.name}
  end

  private 

    def character_params
      params.require(:character).permit(:name, :description, :picture)
    end 
end
