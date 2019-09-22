class UsersController < ApplicationController

  before_action :require_admin, only: [:index]

  def index
    @users = User.all
  end

  private

    def require_admin
      current_user.admin
    end
end
