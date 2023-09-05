class MapController < ApplicationController
  def show_reviews
    @reviews = Review.where.not(latitude: nil)
  end
end
