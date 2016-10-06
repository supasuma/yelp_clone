require 'rails_helper'

feature 'reviewing' do

    scenario 'allows user to leave review using a form' do
      signup_user
      add_kfc_restaurant
      click_link 'Review KFC'
      fill_in('Comments', with: "5 star dining at it's best")
      select '5', from: 'Rating'
      click_button 'Leave Review'
      expect(current_path).to eq '/restaurants'
      expect(page).to have_content "5 star dining at it's best"
    end
  end
