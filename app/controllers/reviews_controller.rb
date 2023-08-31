class ReviewsController < ApplicationController
  
  def new
  end
  
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review.shop
    else
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
    params.require(:review).permit(:rate, :comment, :exist_counter_sheets?,
                                   :frequent_solo_visitors, :exist_solo_tables?,
                                   :easy_to_order, :delivery_speed, :calmness)
  end
end
