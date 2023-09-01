class ShopsController < ApplicationController
  before_action :set_q, only: :index
  def index
    @shops = @q.result
  end

  def show
  end

  def set_q
    @q = Shop.ransack(params[:q])
  end
end
