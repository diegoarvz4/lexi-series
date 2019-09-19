class SeriesController < ApplicationController


  def index
    @series = Series.all
  end

  def show
    @series = Series.find_by(id: params[:id])
  end

  def new 
    @series = Series.new
  end

  def edit
  end 

  def update 
  end 

  def destroy 
  end  

  def create 
    @series = Series.new(series_params)
    if @series.save
      redirect_to @series
    else  
      redirect_to root
    end 
  end 
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Series.find(params[:id])
    end

    def series_params
      params.require(:series).permit(:picture)
    end

end
