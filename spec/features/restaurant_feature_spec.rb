require 'rails_helper'

describe 'restaurants' do
	
	context 'no restaurants have been added' do
		it 'Should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
			expect(page).to have_link 'Add a restaurant'
		end
	end

	context 'restaurants have been added' do
		before do
			Restaurant.create(name: 'Maze')
		end

		it 'should display them' do
			visit '/restaurants'
			expect(page).to have_content 'Maze'
		end
	end

	context 'Users can add, delete and edit restaurants' do

		before do
			Restaurant.create(name: 'Maze')
		end

		it 'allows the user to add a restaurant' do
			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'Name', with: 'Byron'
			click_button 'Create Restaurant'
			expect(page).to have_content 'Byron'
		end
		it 'Allows a user to edit a restaurant' do
			visit '/restaurants'
			click_link 'Edit Maze'
			fill_in 'Name', with: 'Hakkasan'
			click_button 'Update Restaurant'
			expect(page).to have_content 'Hakkasan'
		end
		it 'Allows a user to delete a restaurant' do
			visit '/restaurants'
			click_link 'Delete Maze'
			expect(page).not_to have_content 'Maze'
		end
	end

end