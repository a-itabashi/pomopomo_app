class UsersController < ApplicationController
  before_action :not_allow_show, only: %i[show]

  def show
    @user = User.find(params[:id])
  end

  private

    def not_allow_show
      @user = User.find(params[:id])
      unless current_user.try(:admin) || current_user.id == @user.id
        flash[:alert] = "アクセスできません。"
        redirect_to musics_index_path
      end
    end
end
