class FavoritesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    favorite = current_user.favorites.build(bookmark: @bookmark)

    if favorite.save
      redirect_to @bookmark
    else
      render :show
    end
  end
end
