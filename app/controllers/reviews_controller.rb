# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [ :new, :create ]

  def new
    puts ">>>>>>>>>>>>>>>>>>>   new   <<<<<<<<<<<<<<<<<<<<<<<<<"
    @review = Review.new
  end

  def create
    puts ">>>>>>>>>>>>>>>>>>>   create   <<<<<<<<<<<<<<<<<<<<<<<<<"
    @review = @restaurant.reviews.build(review_params)
    @review.save
    redirect_to :restaurants_controller => 'get', :action => 'show'
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
