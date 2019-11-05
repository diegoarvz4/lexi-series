class TermsController < ApplicationController
  def new
    @glosary = Glosary.find_by(id: params[:glosary_id])
    @term = Term.new
  end

  def create
    @glosary = Glosary.find_by(id: params[:term][:glosary_id])
    @term = @glosary.terms.build(src_term: params[:term][:src_term],
                         dst_term: params[:term][:dst_term],
                         comments: params[:term][:comments])
    if @term.save
      flash.notice = "Término añadido"
      redirect_to @glosary
    else
      render 'new'
    end

  end

  def edit
  end

  def update
  end
end
