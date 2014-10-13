require 'rails_helper'

# As an user
# I want to see bookmarks listed by decending creation date
# So I can see the most recent bookmarks on top of the list.

feature "Sort bookmarks by decending creation date" do
  scenario "successfully" do
    FactoryGirl.create(:bookmark, title: "Bookmark_2", created_at: 2.days.ago)
    FactoryGirl.create(:bookmark, title: "Bookmark_1", created_at: 1.days.ago)
    FactoryGirl.create(:bookmark, title: "Bookmark_3", created_at: 3.days.ago)
    FactoryGirl.create(:bookmark, title: "Bookmark_4", created_at: 4.days.ago)

    visit bookmarks_path

    expect("Bookmark_1").to appear_before"Bookmark_2"
    expect("Bookmark_4").to_not appear_before"Bookmark_3"
  end
end
