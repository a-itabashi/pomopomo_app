class Admin::UsersController < ApplicationController
  before_action :find_id_by_params, only: %i[edit update destroy]

  def index
    # N+1問題を後ほど考慮する
    @users = User.all
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

  def edit
  end

  def update
    @user.update(set_params)
    if @user.save
      flash[:success] = "プロフィールを編集しました"
      redirect_to admin_users_path
    else
      render 'edit'
    end

  end

  def destroy
    @user.destroy
    flash[:info] = "ユーザーを削除しました"
    redirect_to admin_users_path
  end


  private
  
  def set_params
    params.require(:user).permit(:name,:email, :password, :password_confirmation, :admin, :uid, :avatar)
  end

  def find_id_by_params
    @user = User.find(params[:id])
  end

end
