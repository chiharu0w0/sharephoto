class ToppagesController < ApplicationController
  def index
    if logged_in?
      @users = User.order(id: :desc).page(params[:page]).per(27)
    end
  end
end
