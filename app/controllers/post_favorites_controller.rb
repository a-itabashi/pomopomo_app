class PostFavoritesController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    current_user.post_favorites.create(post_id: params[:post_id])
      respond_to do |format|
        format.js{render :create}
      end
  end

  def destroy
    @post = Post.find(params[:post_id])
    current_user.post_favorites.find_by(id: params[:id]).destroy
      respond_to do |format|
        format.js{render :destroy}
      end
  end
  
end
