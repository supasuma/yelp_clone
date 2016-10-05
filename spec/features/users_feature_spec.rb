require 'rails_helper'

feature 'User can sign in and out' do
  context "user not signed in and on the homepage" do
    it "should see a sign in link and a sign up link" do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    it "should not see 'sign out' link" do
     visit('/')
     expect(page).not_to have_link('Sign out')
     end
   end

   context "user signed in on the homepage" do
     before do
      signup_user
     end

     it "should see 'sign out' link" do
       visit('/')
       expect(page).to have_link('Sign out')
     end

     it "should not see a 'sign in' link and a 'sign up' link" do
       visit('/')
       expect(page).not_to have_link('Sign in')
       expect(page).not_to have_link('Sign up')
     end
   end

   context "signed in user can create more than one restaurant" do
     it "can create 2 different restaurants" do
       signup_user
       add_kfc_restaurant
       click_link('Add a restaurant')
       fill_in('Name', with: 'Dirty Bones')
       click_button('Create Restaurant')
       expect(page).to have_content('KFC')
       expect(page).to have_content('Dirty Bones')
     end
   end

   context "user can only edit/delete restaurant, they've created" do
     before do
       signup_user
       add_kfc_restaurant
       click_link 'Sign out'
     end

     it "user 2 is not allowed to edit KFC" do
       signup_user2
       click_link 'Edit KFC'
       expect(page).to have_content('error')
     end

   end

end
