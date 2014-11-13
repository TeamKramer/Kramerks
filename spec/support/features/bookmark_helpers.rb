module Features

  def add_hashtags_to_bookmark(bookmark,hashtag)
    bookmark.tag_list.add hashtag
  end

  def create_new_bookmark_with_title(title)
  	visit bookmarks_path
    click_link 'New Bookmark'
    fill_in 'Title', with: title
    fill_in 'Url', with: 'www.coolwebsite.com'
    click_button 'Create Bookmark'
  end
end
