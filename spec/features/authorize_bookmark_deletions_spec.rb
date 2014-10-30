require 'rails_helper'

# As a user
# I want to be able to delete my own bookmarks and
# not let others delete them.

feature 'authorize bookmark deletion' do 
	scenario 'only by bookmark owners' do
		user1 = FactoryGirl.create(:user, email: 'user1@test.com')
		user2 = FactoryGirl.create(:user, email: 'user2@test.com')

		sign_in_with('user1@test.com', 'password')
		create_new_bookmark_with_title("User 1 bookmark")
		sign_out

		sign_in_with('user2@test.com', 'password')
		visit "bookmarks/1"
    	click_link "Delete"

    	visit bookmarks_path
    	expect(page).to have_content("User 1 bookmark")
	end

	scenario 'by only showing delete link to owners' do
		user1 = FactoryGirl.create(:user, email: 'user1@test.com')
		user2 = FactoryGirl.create(:user, email: 'user2@test.com')

		sign_in_with('user1@test.com', 'password')
		create_new_bookmark_with_title("User 1 bookmark")
		sign_out

		sign_in_with('user2@test.com', 'password')
		visit "bookmarks/1"

    	expect(page).not_to have_content("Delete")
	end

	def create_new_bookmark_with_title(title)
  		visit bookmarks_path
    	click_link 'New Bookmark'
    	fill_in 'Title', with: title
    	fill_in 'Url', with: 'www.coolwebsite.com'
    	click_button 'Create Bookmark'
	end

	def sign_in_with(email, password)
    	visit new_user_session_path
    	fill_in 'Email', with: email
    	fill_in 'Password', with: password
    	click_button 'Sign in'
  	end

  	def sign_out
    	visit root_path
    	click_link 'Logout'
  	end
end




