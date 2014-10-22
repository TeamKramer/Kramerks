require 'rails_helper'
# As a user 
# I want to be able to delete a bookmark that I submitted from my personal index
# so I don't have to look at unwanted bookmarks

feature "delete bookmarks" do
  scenario "successfully" do
    user = create(:user)
    bookmark = create(:bookmark, title: "new bookmark")

    # sign_in_with(user.email, user.password)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    visit bookmarks_path
    click_on bookmark.title
    click_link "Delete bookmark"

    visit bookmarks_path
    expect(page).to not_have(bookmark.title)
    
  end
end
