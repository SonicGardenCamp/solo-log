class ShopsController < ApplicationController
  def index
  end

  def show
    @shop = Shop.find(params[:id])
    @reviews = @shop.reviews
  end
end
