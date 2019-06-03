class Admin::UsersController < ApplicationController
  before_action :only_allow_admin

  def index
    @users = User.all.page(params[:page]).per(10).order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)
    uid_column = User.create_unique_string
    @user.uid = uid_column
    if @user.save
      flash[:success] = "ユーザー登録に成功しました"
      redirect_to admin_users_path
    else
      flash[:danger] = "ユーザ登録に失敗しました"
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:info] = "ユーザーを削除しました"
    redirect_to admin_users_path
  end

  private

  def set_params
     params.require(:user).permit(:name, :email, :description, :password, :password_confirmation, :admin, :uid)
  end

  def only_allow_admin
    unless current_user.try(:admin?)
      flash[:alert] = "アクセス権限がありません"
      redirect_to musics_index_path
    end
  end

end