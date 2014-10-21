require 'rails_helper'

#As a user
#I want to be able to favorite a bookmark

feature 'create favorite' do

  scenario 'favorite a bookmark' do
    user = create(:user)
    bookmark = create(:bookmark, )

		#Expect page to have 'Favorited'
		expect(page).to have_content('Unfavorite')	
	end
end
