class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @location = Location.find(params[:location_id])
  end

  def create
    @review = Review.new(review_params)
    @location = Location.find(params[:location_id])
    @review.user = current_user
    @review.location = @location
    if @review.save
      redirect_to location_path(@location)
      # redirect_to entity_locations_path(current_user.entities.first)
    else
      render "locations/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
