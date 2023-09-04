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
    if current_user && current_user.id == @review.user_id
      @review.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: "レビューが削除されました。" }
        format.js
      end
    else
      redirect_to root_path, alert: "レビューの削除に失敗しました。"
    end
  end


  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      # 更新が成功した場合の処理
      redirect_to review_path(@review), notice: 'レビューが更新されました。'
    else
      # 更新が失敗した場合の処理
      render 'edit'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rate, :comment, :counter_sheets_available,
                                   :frequent_solo_visitors, :solo_tables_available,
                                   :easy_to_order, :delivery_speed, :calmness, :shop_id)
  end
  
  def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
      redirect_to root_url, status: :see_other if @review.nil?
  end
end