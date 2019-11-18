class TranslationsController < ApplicationController

  before_action :require_admin, only: [:create, :index]

  def new
    @series = Series.find_by(id: params[:series])
    @episode = Episode.find_by(id: params[:episode])
    @work_users = User.joins(:roles).where('roles.category = ?', 'TRANSLATOR')
    @translation = Translation.new
  end

  def create
    @episode = Episode.find_by(id: params[:translation][:episode_id])
    @translation = @episode.build_translation(translator_id: params[:translation][:translator_id],
                               duedate: params[:translation][:duedate],
                               src_lang: params[:translation][:src_lang],
                               dst_lang: params[:translation][:dst_lang],
                               runtime: params[:translation][:runtime])
    if @translation.save
      flash.notice = 'Traducción Asignada'
      redirect_to @translation
    else
      render 'new'
    end
  end

  def update
    @translation = Translation.find_by(id: params[:id])
    @translation.assign_attributes(translation_params)
    if @translation.save
      flash.notice = 'Traducción Actualizada'
      redirect_to @translation
    else
      render 'edit'
    end
  end

  def edit
    @translation = Translation.find_by(id: params[:id])
    @work_users = User.joins(:roles).where('roles.category = ?', 'TRANSLATOR')
  end

  def show
    @translation = Translation.find_by(id: params[:id])
    @qc = @translation.quality_control
  end

  def index
    @translations = Translation.all
  end

  def destroy
  end

  private

  def require_admin
    redirect_to request.referrer unless current_user.admin
  end

  def translation_params
    params.require(:translation).permit(:translation_id, :src_lang, :dst_lang, :runtime, :duedate, :status)
  end
end
