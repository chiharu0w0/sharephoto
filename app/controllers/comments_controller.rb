class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = @post.id
    @comment.save
    flash[:success] = 'コメントを送信しました'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    @comment.destroy
    flash[:success] = 'コメントを削除しました'
    redirect_back(fallback_location: root_url)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to root_url
    end
  end
end
