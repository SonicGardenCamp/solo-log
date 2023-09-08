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
  
  def edit
    @shop = Shop.find(params[:id])
  end
  
  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      @shop.update_lat_and_long
      flash[:notice] = "店舗の編集に成功しました。"
      redirect_to root_path
    else
      flash[:alert] = "店舗の編集に失敗しました。"
      render 'edit', status: :unprocessable_entity
    end
  end
  
  def destroy
    @shop = Shop.find(params[:id])
    if @shop.destroy
      flash[:notice] = "店舗の削除に成功しました。"
      redirect_to root_path
    else
      flash[:alert] = "店舗の削除に失敗しました。"
      redirect_to root_path
    end
  end
  
  private
  
  def shop_params
    params.require(:shop).permit(:name, :image, :address, :genre)
  end
end
