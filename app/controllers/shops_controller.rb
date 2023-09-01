class ShopsController < ApplicationController
  before_action :set_q, only: :index
  def index
    @result = @q.result
    @shops = @result.order(:id)
  end

  def show
    @shop = Shop.find(params[:id])
    @reviews = @shop.reviews
  end

  def set_q
    @q = Shop.ransack(params[:q])
  end
end
