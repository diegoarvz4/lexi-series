class SeriesController < ApplicationController


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
    series = Series.find_by(id: params[:id])
    series.assign_attributes(series_params)

    if series.save 
      flash.notice = '¡Serie actualizada!'
      redirect_to series
    else 
      render 'edit'
    end 
  end 

  def destroy 
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

end
