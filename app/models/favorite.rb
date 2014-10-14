class Favorite < ActiveRecord::Base
  belongs_to :bookmark
  belongs_to :user

  validates :user_id, presence: true
  validates :bookmark_id, presence: true
end
