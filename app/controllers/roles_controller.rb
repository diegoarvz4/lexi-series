class RolesController < ApplicationController
  before_action :require_admin, only: [:create]

  def create
    @role = Role.new(user_id: params[:user_id], category: params[:category])
    if @role.save
      flash.notice = '¡Nuevo rol asignado!'
    else
      flash.alert = '¡Rol ya asignado!'
    end
    redirect_to users_path
  end

  private

  def require_admin
    redirect_to root_path unless current_user.admin
  end
end
