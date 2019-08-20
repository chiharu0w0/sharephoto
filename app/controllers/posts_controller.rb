class PostsController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :new]
  before_action :correct_user, only: [:destroy]
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    @comment = current_user.posts
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿しました'
      redirect_to root_url
    else
      @posts = current_user.feed_posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def destroy
    @post.destroy
    flash[:success] = '削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:image, :description)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end
