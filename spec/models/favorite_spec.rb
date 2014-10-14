require 'rails_helper'

RSpec.describe Favorite, :type => :model do
  it "should be valid with a user and bookmark" do
    user = create(:user)
    bookmark = create(:bookmark)

    favorite = Favorite.new(user: user, bookmark: bookmark)
    expect(favorite).to be_valid
  end

  it "should be invalid without a user" do
    bookmark = create(:bookmark)
    
    favorite = Favorite.new(user: nil, bookmark: bookmark)
    favorite.valid?
    expect(favorite.errors[:user_id]).to include("can't be blank")
  end

  it "should be invalid without a bookmark" do
    user = create(:user)
    
    favorite = Favorite.new(user: user, bookmark: nil)
    favorite.valid?
    expect(favorite.errors[:bookmark_id]).to include("can't be blank")
  end
end
