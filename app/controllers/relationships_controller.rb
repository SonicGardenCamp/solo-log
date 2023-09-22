class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html do
        if params[:review_id].present?
          redirect_to review_path(params[:review_id])
        else
          redirect_to @user
        end
      end
      format.turbo_stream
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html do
        if params[:review_id].present?
          redirect_to review_path(params[:review_id])
        else
          redirect_to @user
        end
      end
      format.turbo_stream
    end
  end
end
