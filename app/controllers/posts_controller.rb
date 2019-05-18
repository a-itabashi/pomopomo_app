class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(set_params)
    @posts = Post.all
    if @post.save
      respond_to do |format|
        format.js{render :index}
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
  end


  private

  def set_params
    params.require(:post).permit(:content, :post_image, :user_id)
  end

end
