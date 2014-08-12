require 'rails_helper'

describe 'restaurants' do
	
	context 'no restaurants have been added' do
		it 'Should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
			expect(page).to have_link 'Add a restaurant'
		end
	end

	context 'Allows a user to add a restaurant and it`s cuisine' do
		before do
			Restaurant.create(name: 'Maze', cuisine: 'French/Japanese')
		end

		it 'should display them' do
			visit '/restaurants'
			expect(page).to have_content 'Maze'
		end

		it 'should display the cuisine' do
			visit '/restaurants'
			expect(page).to have_content 'French/Japanese'
		end
	end

	context 'Users can add, delete and edit restaurants' do

		before do
			Restaurant.create(name: 'Maze', cuisine: 'French/Japanese')	
		end

		it 'allows the user to add a restaurant' do
			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'Name', with: 'Byron'
			fill_in 'Cuisine', with: 'American'
			click_button 'Create Restaurant'
			expect(page).to have_content 'Byron'
			expect(page).to have_content 'American'
		end

		it 'Allows a user to edit a restaurant' do
			visit '/restaurants'
			click_link 'Edit Maze'
			fill_in 'Name', with: 'Hakkasan'
			fill_in 'Cuisine', with: 'Chinese'
			click_button 'Update Restaurant'
			expect(page).to have_content 'Hakkasan'
			expect(page).to have_content 'Chinese'
		end

		it 'Allows a user to delete a restaurant' do
			visit '/restaurants'
			click_link 'Delete Maze'
			expect(page).not_to have_content 'Maze'
		end
	end

	context 'Users have the option to add reviews to their desired restaurants' do
		
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
			expect(page).to have_content "5"
		end
	end


end










