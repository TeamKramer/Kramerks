module Features

  def create_user_and_sign_in

    user = create(:user)
    
  end

  def create_user
    
  end

  def sign_in_with_user
    visit_root_path
    click_link 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in' 
  end
end

