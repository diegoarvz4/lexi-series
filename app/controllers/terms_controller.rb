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
      respond_to do |format|
        format.html { redirect_to @glosary }
        format.js
      end
    else
      render 'new'
    end

  end

  def edit
    @term = Term.find_by(id: params[:id])
  end

  def update
    @term = Term.find_by(id: params[:id])
    @term.assign_attributes(terms_params)
    if @term.save
      flash.notice = 'Término actualizado'
      redirect_to @term.glosary
    else
      render 'edit'
    end
  end

  def destroy
    @term = Term.find_by(id: params[:id])
    @glosary = @term.glosary
    @term.destroy
    flash.notice = 'Término eliminado'
    redirect_to @glosary
  end

  private

  def terms_params
    params.require(:term).permit(:src_term, :dst_term, :comments)
  end
end
