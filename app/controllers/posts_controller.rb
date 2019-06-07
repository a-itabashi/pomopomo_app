class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = Post.page(params[:page]).per(10).order(created_at: :desc)
    @post = Post.new
    respond_to do |format|
      format.js{render :post} 
      format.html
    end
  end

  def create
    @post = current_user.posts.build(set_params)
    @posts = Post.page(params[:page]).per(10).order(created_at: :desc)
    if @post.save
      respond_to do |format|
        format.js{render :index}
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @posts = Post.page(params[:page]).per(10).order(created_at: :desc)
    if @post.destroy
      respond_to do |format|
        format.js{render :index}
      end
    end
  end

  private

  def set_params
    params.require(:post).permit(:content, :post_image, :user_id)
  end
  
end
