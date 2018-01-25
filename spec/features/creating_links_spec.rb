
feature 'creating a link' do
  scenario 'adding a site address and title to bookmark' do
    visit '/links/new'
    fill_in 'title', with: 'bbc'
    fill_in 'url', with: 'www.bbc.com'
    fill_in 'tag', with: 'bbc'
    click_button 'Submit'
    expect(page).to have_content("www.bbc.com")
  end
end
