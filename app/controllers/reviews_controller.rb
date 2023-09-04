class ReviewsController < ApplicationController
  
  def new
    @shop = Shop.find(params[:shop_id])
    @review = @shop.reviews.build
  end
  
  def create
    @review = Review.new(review_params)
    @review.user = current_user if user_signed_in?
    if @review.save
      flash[:notice] = "作成できました"
      redirect_to @review.shop
    else
      flash[:alert] = "作成できませんでした"
      render 'new'
    end
  end
  
  def show
    @review = Review.find(params[:id])
    @user = @review.user
  end
  
  #def destroy
  #end

  private

  def review_params
    params.require(:review).permit(:rate, :comment, :exist_counter_sheets,
                                   :frequent_solo_visitors, :exist_solo_tables,
                                   :easy_to_order, :delivery_speed, :calmness)
  end
end