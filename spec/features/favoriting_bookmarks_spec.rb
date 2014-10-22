require 'rails_helper'

#As a user
#I want to be able to favorite a bookmark

feature 'create favorite' do

  scenario 'favorite a bookmark' do
    user = create(:user)
    bookmark = create(:bookmark)
    #User logs in
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully')

    #User goes to bookmark_show
    visit bookmarks_path
    click_link "#{bookmark.title}"

    #User clicks on Favorite
    click_link 'Favorite'
    expect(page).to have_content('Unfavorite')	

  end
end
