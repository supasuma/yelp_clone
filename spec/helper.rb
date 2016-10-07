
def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'
end

def log_in_1
  visit '/'
  click_link 'Sign in'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
end

def log_in_2
  visit '/'
  click_link 'Sign in'
  fill_in 'Email', with: 'test2@test.com'
  fill_in 'Password', with: 'password2'
  click_button 'Log in'
end

def add_restaurant
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'KFC'
  fill_in 'Description', with: 'Chicken-ie'
  click_button 'Create Restaurant'
end

def add_review(thoughts, rating)
  visit '/restaurants'
  click_link 'Review KFC'
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end
