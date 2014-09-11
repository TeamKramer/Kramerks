require 'rails_helper'

#As a user
#I want to be able to create a user account
#So I can log in and view my bookmarks

feature 'create user' do
	
	scenario 'successfully' do 
		visit root_path
		click_link 'Sign up'
		fill_in 'Email', with: 'd@g.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		click_button 'Sign up'
		
		user = User.first
		user.confirm!

		visit root_path

		click_link 'Login'
    fill_in 'Email', with: 'd@g.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')

	end

end
