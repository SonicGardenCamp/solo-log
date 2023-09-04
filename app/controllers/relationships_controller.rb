class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    #redirect_to review_path(params[:review_id])
    respond_to do |format|
      format.html { redirect_to review_path(params[:review_id]) }
      format.turbo_stream
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    #redirect_to review_path(params[:review_id])
    respond_to do |format|
      format.html { redirect_to review_path(params[:review_id]) }
      format.turbo_stream
    end
  end
end
