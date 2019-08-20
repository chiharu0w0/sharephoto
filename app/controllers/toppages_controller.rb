class ToppagesController < ApplicationController

  def index
    if logged_in?
      @posts = current_user.feed_posts.order(id: :desc).page(params[:page])
      @users = User.order(id: :desc).page(params[:page]).per(27)
    end
  end
end
