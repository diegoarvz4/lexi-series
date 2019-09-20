class RelationshipsController < ApplicationController
  def new
    @relationship = Relationship.new
    @series = Series.find_by(id: params[:series_id])
    @character = Character.find_by(id: params[:character_id])
    @characters = @series.characters.reject{ |ch|
                  ch == @character
                }
    @characters -= @character.relationships.map{|relationship| relationship.related} - @character.inverse_relationships.map{|relationship| relationship.related} 
    @character_options = Hash.new
    @characters.each do |character|
      @character_options[character.name] = character.id
    end
  end

  def create

    @relationship = Relationship.new(relationship_params)
    if @relationship.save
      flash[:success] = 'Relationship created!'
      redirect_to @relationship
    else
      render 'new'
    end
  end
  
  def update
    @relationship = Relationship.find_by(id: params[:id])
    @relationship.assign_attributes(relationship_params)
    if @relationship.save
      flash[:success] = '¡Relación Actualizada!'
      redirect_to @relationship
    else
      render 'edit'
    end
  end

  def show
    @relationship = Relationship.find_by(id: params[:id])
    @character = @relationship.character
    @related = @relationship.related
  end

  def edit
    @relationship = Relationship.find_by(id: params[:id])
    @character = @relationship.character
    @related = @relationship.related
  end

  private

  def relationship_params
    params.require(:relationship).permit(:character_id, :related_id, :description)
  end
end
