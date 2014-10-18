module Features

  def sign_in_with(email, password)
    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign in'
  end

  def sign_out
    visit root_path
    click_on 'Sign out'
  end
end
