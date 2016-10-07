require 'rails_helper'

feature 'reviewing' do

  before { Restaurant.create name: 'KFC' }
  before { User.create email: 'test@test.com', password: 'password' }
  before { User.create email: 'test2@test.com', password: 'password2'}

  scenario 'allows users to leave a review using a form' do
    add_review('so so', 3)
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  context 'deleting reviews' do

    scenario 'a user can delete a review that they created' do
      log_in_1
      add_review('so so', 3)
      click_link 'KFC'
      click_link 'Delete review'
      expect(page).to have_content('Review deleted successfully')
    end

    scenario 'user cannot see delete review button if not the creator' do
      log_in_1
      add_review('so so', 3)
      click_link 'Sign out'
      log_in_2
      click_link 'KFC'
      expect(page).not_to have_link('Delete review')
    end
  end

  scenario 'displays an average rating for all reviews' do
    log_in_1
    add_review('So so', 3)
    click_link 'Sign out'
    log_in_2
    add_review('Great', 5)
    expect(page).to have_content('Average rating: 4')
  end


end
