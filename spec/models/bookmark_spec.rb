require 'rails_helper'

RSpec.describe Bookmark, :type => :model do

  it 'is invalid when the URL doesn\'t end in a top level domain' do
    bookmark = Bookmark.new(url: 'www.facebook.yz', title: 'facebook')
    expect(bookmark).to be_invalid
  end
end
