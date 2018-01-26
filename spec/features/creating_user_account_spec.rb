
feature 'creating a user account' do
  scenario 'visit the relevant page and sign-up to app' do
    sign_up
    expect(current_path).to eq '/links'
    expect(page).to have_content("Welcome user.email@gmail.com")
    expect(User.count).to eq 1
  end

  scenario 'password confirmation' do
    visit '/'
    fill_in 'email', with: 'user.email@gmail.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'error'
    click_button 'Submit'
    expect(User.count).to eq 0
  end
end
