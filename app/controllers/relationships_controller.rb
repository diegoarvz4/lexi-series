class RelationshipsController < ApplicationController
  def new
    @relationship = Relationship.new
  end 

  def create 
  end
  
  def update
  end 

  def show 
    @relationship = Relationship.find_by(id: params[:id])
    @character = @relationship.character
    @related = @relationship.related
  end 

  def edit 
  end
end
