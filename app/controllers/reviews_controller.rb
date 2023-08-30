class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end
  
  def new
  end
  
  def create
  end
  
  #def destroy
  #end
end
