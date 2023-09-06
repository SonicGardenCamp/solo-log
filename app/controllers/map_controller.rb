class MapController < ApplicationController
  def show_shops
    @shops = Shop.where.not(latitude: nil)
  end
end
