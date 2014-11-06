class BookmarkPolicy < ApplicationPolicy

  def destroy?
  	binding.pry
    bookmark_id = @bookmark.id
    bookmark_owner = @bookmark.user_id

  end
end