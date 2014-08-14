require 'rails_helper'

describe 'reviews' do

	context 'Users have the option to add or delete a review of their desired restaurants' do
		
		before do
			Restaurant.create(name: 'Maze', cuisine: 'French/Japanese')	
		end

		it 'Allows a user to add a review' do
			visit '/restaurants'
			click_link 'Review Maze'
			fill_in 'Thoughts', with: "Amazing"
			select '5', from: "Rating"
			click_button 'Leave Review'
			expect(page).to have_content "Amazing"
			expect(page).to have_content "★★★★★"
		end

		it ' Allows a user to delete a review' do
			visit '/restaurants'
			click_link 'Review Maze'
			fill_in 'Thoughts', with: "Amazing"
			select '5', from: "Rating"
			expect(page).to have_content "Amazing"
			expect(page).to have_content "5"
			click_button 'Leave Review'
			click_link 'Delete review for Maze'
			expect(page).not_to have_content "Amazing"
			expect(page).not_to have_content "★★★★★"
		end

	end

	context 'Displays the average rating of the restaurant' do

		before do
			restaurant = Restaurant.create(name: 'Maze', cuisine: 'French/Japanese')	
			restaurant.reviews.create(rating: "5", thoughts: "Good")
			restaurant.reviews.create(rating: "4", thoughts: "Lovely")	
		end

		it 'Allows the average review to be displayed'	do
			visit '/restaurants'
			expect(page).to have_content "Average Rating: ★★★★★" 
		end
	end


end