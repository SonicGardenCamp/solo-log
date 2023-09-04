class ReviewsController < ApplicationController

  def new
    @shop = Shop.find(params[:shop_id])
    @review = @shop.reviews.build
  end

  def create
    @review = Review.new(review_params)
    @review.shop_id = params[:shop_id]
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
    @user = current_user if user_signed_in?
  end
  
  def destroy
    @review = Review.find(params[:id])
  
    # ユーザーが削除権限を持つことを確認
    if current_user && current_user.id == @review.user_id
      shop = @review.shop # レビューが関連付けられているショップを取得
      @review.destroy
      flash[:notice] = "レビューが削除されました。"
      redirect_to shop_path(shop) # ショップページにリダイレクト
    else
      flash[:alert] = "削除権限がありません。"
      redirect_to request.referrer || shop_path(@review.shop)
    end
  end


  
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Rview.find(params[:id])
    if @review.update
      # 更新に成功した場合を扱う
      flash[:success] = "レビューが更新されました"
      redirect_to @review.shop
    else
      # 更新に失敗した場合は再度editページへ
      flash[:alert] = "更新に失敗しました"
      render 'edit', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rate, :comment, :counter_sheets_available,
                                   :frequent_solo_visitors, :solo_tables_available,
                                   :easy_to_order, :delivery_speed, :calmness)
  end
end