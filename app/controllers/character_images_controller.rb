class CharacterImagesController < ApplicationController
  def new
    @character_image = CharacterImage.new
    @character = Character.find_by(id: params[:character_id])
  end

  def create
    @character_image = CharacterImage.new(character_id: params[:character_image][:character_id],
                                            picture: params[:character_image][:picture])
    if @character_image.save
      flash.notice = 'Imagen agregada'
      redirect_to @character_image.character
    else
      render 'new'
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private 

  def character_params
    params.require(:character_image).permit(:picture, :character_id)
  end 
end
