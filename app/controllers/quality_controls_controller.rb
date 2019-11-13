class QualityControlsController < ApplicationController

  before_action :require_admin, only: [:create]

  def new
    @translation = Translation.find_by(id: params[:id])
    @qc = QualityControl.new
    @reviewers = User.joins(:roles).where('roles.category = ?', 'QC')
  end

  def create
    @translation = params[:quality_control][:translation_id]
    max_score = params[:quality_control][:max_score]
    reduced_score = params[:quality_control][:reduced_score]
    final_score = max_score.to_f - reduced_score.to_f
    effectiveness = (final_score / max_score.to_f) * 100.to_f
    grade = ''
    if effectiveness >= 95
      grade = 'A'
    elsif effectiveness < 95 && effectiveness >= 90
      grade = 'B'
    elsif effectiveness < 90 && effectiveness >= 85
      grade = 'C'
    else
      grade = 'D'
    end
    @qc = QualityControl.new(feedback: params[:quality_control][:feedback],
                             reviewer_id: params[:quality_control][:reviewer_id],
                             effectiveness: effectiveness,
                             final_score: final_score,
                             loops: params[:quality_control][:loops],
                             max_score: params[:quality_control][:max_score],
                             reduced_score: params[:quality_control][:reduced_score],
                             translation_id: params[:quality_control][:translation_id],
                             grade: grade)
    if @qc.save
      flash.notice = 'QC Realizado'
      redirect_to @qc.translation
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
    @qc = QualityControl.find_by(id: params[:id])
  end

  def index
  end

  private 

  def qc_params
    params.require(:quality_control).permit(:translation_id, :reviewer_id, :loops, :max_score, :reduced_score, :feedback)
  end

  def require_admin
    redirect_to request.referrer unless current_user.admin
  end
end
