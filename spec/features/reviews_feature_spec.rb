require 'rails_helper'

feature 'reviewing' do

  before { Restaurant.create(name: 'KFC')}

    scenario 'allows user to leave review using a form' do
      visit '/restaurants'
      click_link 'Review KFC'
      fill_in('Comments', with: "5 star dining at it's best")
      select '5', from: 'Rating'
      click_button 'Leave Review'
      expect(current_path).to eq '/restaurants'
      expect(page).to have_content "5 star dining at it's best"
    end

  end
