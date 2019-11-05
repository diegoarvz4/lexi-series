class GlosariesController < ApplicationController
  def new
    @glosary = Glosary.new
    @series = Series.find_by(id: params[:series_id])
  end

  def create
    @glosary = Series.find_by(id: params[:glosary][:series_id]).glosaries.build(title: params[:glosary][:title])
    if @glosary.save
      flash.notice = "Glosario añadido a #{@glosary.series.name}"
      redirect_to @glosary
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @glosary = Glosary.find_by(id: params[:id])
    @terms = @glosary.terms
  end
end
