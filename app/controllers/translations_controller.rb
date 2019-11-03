class TranslationsController < ApplicationController
  def new
    @series = Series.find_by(id: params[:series])
    @episode = Episode.find_by(id: params[:episode])
    @work_users = User.joins(:roles).where('roles.category = ?', 'WORK')
    @translation = Translation.new
  end

  def create
    @episode = Episode.find_by(id: params[:translation][:episode_id])
    @episode.build_translation(translator_id: params[:translation][:translator_id],
                               duedate: params[:translation][:duedate])
    if @episode.save
      flash.notice = 'Traducción Asignada'
      redirect_to request.referrer
    else 
      render 'new'
    end

  end

  def update
  end

  def edit
  end

  def show
  end

  def index
  end

  def destroy
  end
end
