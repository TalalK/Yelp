require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe 'It should validate that the restaurant' do

	it 'Should only accept restaurants with > 2 characters' do
		restaurant = Restaurant.new(name: 'ab')
		expect(restaurant).to have(1).error_on(:name)
	end

	context 'Computing average ratings' do
		it 'Returns N/A if there are no ratings'do
		
			restaurant = Restaurant.new(name: 'Maze')
			expect(restaurant.average_rating).to eq "N/A"

		end

		it 'If there is only one review, it returns that rating' do
			restaurant = Restaurant.create(name: 'Maze', cuisine: 'French/Japanese')	
			restaurant.reviews.create(rating: "5", thoughts: "Good")

			expect(restaurant.average_rating).to eq 5

		end

		it 'Provides with the averages of one or more restaurant ratings' do
			restaurant = Restaurant.create(name: 'Maze', cuisine: 'French/Japanese')	
			restaurant.reviews.create(rating: "5", thoughts: "Good")
			restaurant.reviews.create(rating: "4", thoughts: "Lovely")

			expect(restaurant.average_rating).to eq 4.50

		end
	end
end