class PostsController < ApplicationController
  before_action :delete_post_image, only: %i[create]

  def index
    @posts = Post.page(params[:page]).per(10).order(created_at: :desc)
    @post = Post.new
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
    @post.destroy
    redirect_to posts_path
  end


  private

  def set_params
    params.require(:post).permit(:content, :post_image, :user_id)
  end

  # リファクタリングを後ほど予定
  def delete_post_image
    ActiveStorage::Blob.unattached.find_each(&:purge)
  end
end
