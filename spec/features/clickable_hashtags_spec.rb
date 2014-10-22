require 'rails_helper'

# As a user
# I want to be able to click on a hashtag topic and then display a view with
#   the entire collection of only related bookmarks
# So I browse my bookmaks more easily.

feature 'display bookmarks' do

  scenario 'using a hashtag' do
    create_bookmark("lion", "www.lion.com", "animals")
    create_bookmark("jupiter", "www.jupiter.com", "planets")

    visit bookmarks_path

    expect(page).to have_content("lion")
    expect(page).to have_content("jupiter")

    click_on 'animals'
    expect(page).to have_content("lion")
    expect(page).to_not have_content("jupiter")
  end

  def create_bookmark(title, url, tags)
    visit bookmarks_path
    click_link 'New Bookmark'
    fill_in 'Title', with: title
    fill_in 'Url', with: url
    fill_in 'Tags (separated by commas)', with: tags 
    click_button 'Create Bookmark'
  end
end
