class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @studies = @user.studies
  end
  
end
