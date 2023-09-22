class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.page(params[:page]).per(20) 
    @total_reviews_count = @user.reviews.count
  end
  
  def following
    @user  = User.find(params[:id])
    @users = @user.following
    render 'following'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'followers'
  end
end
