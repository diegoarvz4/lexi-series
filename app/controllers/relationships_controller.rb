class RelationshipsController < ApplicationController
  before_action :set_series, only: [:new]
  before_action :set_relationship, only: %i[show edit update]

  def new
    @relationship = Relationship.new
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
    @relationship.assign_attributes(relationship_params)
    if @relationship.save
      flash.notice = '¡Relación Actualizada!'
      redirect_to @relationship
    else
      render 'edit'
    end
  end

  def show
    @character = @relationship.character
    @related = @relationship.related
  end

  def edit
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
    characters = @series.characters.reject do |character|
      character == current_character
    end
    characters -= current_character.relationships.map(&:related)
    characters -= current_character.inverse_relationships.map(&:character)
    characters
  end

  def set_series
    @series = Series.find_by(id: params[:series_id])
  end

  def set_relationship
    @relationship = Relationship.find_by(id: params[:id])
  end
end
