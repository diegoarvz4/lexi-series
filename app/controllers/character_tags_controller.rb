class CharacterTagsController < ApplicationController
  def show
    @character_tag = CharacterTag.find_by(id: params[:id])
    @characters = @character_tag.series.characters
  end

  def index
  end

  def new
  end

  def create
    @character = Character.find_by(id: params[:character_tag][:character_id])
    @series = Series.find_by(id: params[:character_tag][:series_id])

    if @character_tag = CharacterTag.find_by(content: params[:character_tag][:content].strip)
      #if @character_tag.content.match(/^\#\S*$/)
        @character_tag.characters << @character
        respond_to do |format|
          format.html { redirect_to @character_tag }
          format.js
        end
      #else
      #  render 'new'
      # end
    else
      @character_tag = CharacterTag.new(series_id: @series.id,
        content: params[:character_tag][:content].strip)
      if @character_tag.save
        @character_tag.characters << @character
        respond_to do |format|
          format.html { redirect_to @character_tag }
          format.js
        end
      else
        render 'new'
      end
    end
  end

  def edit
  end

  def update
    @character = Character.find_by(id: params[:character_tag][:character_id])
    @character_tag = CharacterTag.find_by(id: params[:id])
    @character_tag.characters << @character
    respond_to do |format|
      format.html { redirect_to @character_tag }
      format.js
    end
  end

  def destroy
    @character_tag = CharacterTag.find_by(id: params[:id])
    @series = @character_tag.series
    @character_tag.destroy
    flash.notice = 'HashTag Eliminado'
    redirect_to @series
  end
end
