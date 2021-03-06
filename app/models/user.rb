class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :favorites, dependent: :destroy
  has_many :bookmarks

  def favorited(bookmark)
    favorites.where(bookmark_id: bookmark.id).first
  end
end
