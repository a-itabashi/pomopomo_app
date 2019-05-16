class Admin::UsersController < ApplicationController


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


  private
  
  def set_params
    params.require(:user).permit(:name,:email, :password, :password_confirmation, :admin, :uid)
  end

end
