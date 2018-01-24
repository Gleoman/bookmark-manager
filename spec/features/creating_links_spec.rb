
feature 'creating a link' do
  scenario 'adding a site address and title to bookmark' do
    visit '/links/new'
    fill_in 'title', with: 'bbc'
    fill_in 'url', with: 'www.bbc.com'
    click_button 'Submit'
    expect(page).to have_content("www.bbc.com")
  end

  scenario 'adding a tag to a link' do
    visit '/links/new'
    fill_in 'title', with: 'Arsenal'
    fill_in 'url', with: 'www.arsenal.com'
    fill_in 'tag', with: 'football'
    click_button 'Submit'
    expect(page).to have_content("football")
  end
end
