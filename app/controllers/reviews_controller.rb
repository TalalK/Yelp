class ReviewsController < ApplicationController

	def new
		@restaurant = Restaurant.find(params['restaurant_id'])
		@review = Review.new
	end

	def create
		@restaurant = Restaurant.find(params['restaurant_id'])
		@restaurant.reviews.create(params[:review].permit(:rating, :thoughts))
		redirect_to '/restaurants'
	end

	def destroy
		@review = Review.find(params['id'])
		@review.destroy

		flash[:notice] = 'Review deleted successfully'
		redirect_to '/restaurants'
	end

end