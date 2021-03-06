class SeriesController < ApplicationController
  before_action :set_series, only: [:show]
  before_action :require_access, only: [:show]

  def index
    if current_user.admin?
      @series = Series.all
    else 
      @series = current_user.series
    end
  end

  def show
    @series = Series.find_by(id: params[:id])
    @episodes = @series.episodes
    @characters = @series.characters
    
  end

  def new 
    @series = Series.new
  end

  def edit
    @series = Series.find_by(id: params[:id])
  end 

  def update 
    @series = Series.find_by(id: params[:id])
    @series.assign_attributes(series_update_params)

    if @series.save 
      flash.notice = '¡Serie actualizada!'
      redirect_to @series
    else 
      render 'edit'
    end 
  end 

  def destroy 
    @series = Series.find_by(id: params[:id])
    @series.destroy
  rescue Excon::Error::Forbidden => error
    puts error
    flash.notice = 'Serie eliminada'
    redirect_to series_index_path
  end  

  def create 
    @series = Series.new(series_params)
    if @series.save
      flash[:success] = 'Success upload!'
      redirect_to @series
    else  
      render 'new'
    end 
  end 
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Series.find(params[:id])
    end

    def series_params
      params.require(:series).permit(:name, :description, :picture)
    end

    def series_update_params
      params.require(:series).permit(:name, :description, :picture, :instructions)
    end

    def require_access
      unless current_user.admin? || @series.users.include?(current_user)
        flash.alert = 'No tienes acceso a esta serie'
        redirect_to root_path 
      end
    end

    def set_series
      @series = Series.find_by(id: params[:id])
    end
end
