class Admins::ShopsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      @shop.update_lat_and_long
      flash[:notice] = "店舗の登録に成功しました"
      redirect_to @shop
    else
      flash.now[:alert] = "店舗の登録に失敗しました"
      render 'new', status: :unprocessable_entity
    end
  end
  
  def shop_params
    params.require(:shop).permit(:name, :image, :address, :genre)
  end
end
