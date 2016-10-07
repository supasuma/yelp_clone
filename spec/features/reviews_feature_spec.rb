require 'rails_helper'

feature 'reviewing' do

  before { Restaurant.create name: 'KFC' }

  scenario 'allows users to leave a review using a form' do
    add_review

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  context 'deleting reviews' do

    before { User.create email: 'test@test.com', password: 'password' }
    before { User.create email: 'test2@test.com', password: 'password2'}

    scenario 'a user can delete a review that they created' do
      log_in_1
      add_review
      click_link 'KFC'
      click_link 'Delete review'
      expect(page).to have_content('Review deleted successfully')
    end

    scenario 'user cannot see delete review button if not the creator' do
      log_in_1
      add_review
      click_link 'Sign out'
      log_in_2
      click_link 'KFC'
      expect(page).not_to have_link('Delete review')
    end

  end

end
