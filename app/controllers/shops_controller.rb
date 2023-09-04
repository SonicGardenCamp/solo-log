class ShopsController < ApplicationController
  before_action :set_q, only: :index
  def index
    @shops = @q.result
    if params[:sort_order] == 'most_rating'
      @shops = Shop.sort_by_count_of_reviews(@shops)
    elsif params[:sort_order] == 'highest_rating'
      @shops = Shop.sort_by_average_rating(@shops)
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @reviews = @shop.reviews
  end

  def set_q
    @q = Shop.ransack(params[:q])
  end
end
