class UsersController < ApplicationController

  before_action :require_admin, only: [:index]

  def index
    @users = User.all
    @series = Series.all
    @series_hash = hash_series(@series)
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
