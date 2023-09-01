class ShopsController < ApplicationController
  before_action :set_q, only: :index
  def index
    @result = @q.result
    @shops = @result.order(:id)
  end

  def show
  end

  def set_q
    @q = Shop.ransack(params[:q])
  end
end
