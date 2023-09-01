class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @shop = 
    @review = Review.new(review_params)
    # もしcurrent_userがいなければ、review.userはnil
    # @review.user = current_user
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
