
feature 'creating a user account' do
  scenario 'visit the relevant page and sign-up to app' do
    sign_up
    expect(current_path).to eq '/links'
    expect(page).to have_content("Welcome user.email@gmail.com")
    expect(User.count).to eq 1
  end
end
