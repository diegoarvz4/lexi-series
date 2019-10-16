class RelationshipsController < ApplicationController
  def new
    @relationship = Relationship.new
    @series = Series.find_by(id: params[:series_id])
    @character = Character.find_by(id: params[:character_id])
    @characters = related_characters(@character)
  end

  def create
    @relationship = Relationship.new(relationship_params)
    if @relationship.save
      flash.notice = '¡Relation creada!'
      redirect_to @relationship
    else
      render 'new'
    end
  end

  def update
    @relationship = Relationship.find_by(id: params[:id])
    @relationship.assign_attributes(relationship_params)
    if @relationship.save
      flash.notice = '¡Relación Actualizada!'
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
    params.require(:relationship).permit(:character_id,
                                         :related_id,
                                         :description)
  end

  def related_characters(current_character)
    characters = @series.characters.reject{|character| character == current_character}
    characters -= current_character.relationships.map(&:related)
    characters -= current_character.inverse_relationships.map(&:character)
  end
end
