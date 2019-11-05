class TranslationsController < ApplicationController
  def new
    @series = Series.find_by(id: params[:series])
    @episode = Episode.find_by(id: params[:episode])
    @work_users = User.joins(:roles).where('roles.category = ?', 'WORK')
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
  end

  def edit
  end

  def show
    @translation = Translation.find_by(id: params[:id])
    @qc = @translation.quality_control
  end

  def index
  end

  def destroy
  end
end
