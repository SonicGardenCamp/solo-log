class ShopsController < ApplicationController
  before_action :set_q, only: :index
  def index
    @shops = @q.result
    if params[:sort_order] == 'most_rating'
      @shops = Shop.sort_by_count_of_reviews(@shops)
    elsif params[:sort_order] == 'highest_rating'
      @shops = Shop.sort_by_average_rating(@shops)
    else
      @shops = Shop.latest(@shops)
    end
    # kaminariのページネーション
    # @shops = @shops.page(params[:page]).per(20)
  end

  def show
    @shop = Shop.find(params[:id])
    @reviews = @shop.reviews.page(params[:page]).per(20) 
    @total_reviews_count = @shop.reviews.count
  end

  def set_q
    @q = Shop.ransack(params[:q])
  end
end
