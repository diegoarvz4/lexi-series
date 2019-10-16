class UsersController < ApplicationController
  before_action :require_admin, only: [:index]

  def index
    @users = User.all
    @series = Series.all
    @series_hash = hash_series(@series)

    @customers_roles = @users.map{|user| user.roles.select{ |role| role.category == 'CUSTOMER' } }.select{|obj| !obj.empty?}.flatten!
    @workers_roles = @users.map{|user| user.roles.select{ |role| role.category == 'WORK' } }.select{|obj| !obj.empty?}.flatten!
  end

  def show 
    @user = User.find_by(id: params[:id])
  end

  private

    def require_admin
      redirect_to root_path unless current_user.admin
    end

    def hash_series(series_array)
      series_array.map do |series|
        [series.id, series.name]
      end
    end
end
