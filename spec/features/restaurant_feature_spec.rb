require 'rails_helper'

describe 'restaurants' do
	
	context 'no restaurants have been added' do
		it 'Should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
			expect(page).to have_link 'Add a restaurant'
		end
	end





end