module Features

  def add_hashtags_to_bookmark(bookmark,hashtag)
    bookmark.tag_list.add hashtag
  end
end
