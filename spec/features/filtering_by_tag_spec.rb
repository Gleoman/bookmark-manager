
feature 'filtering by tag' do
  scenario 'listing all links by tag' do
    sign_up
    visit '/links/new'
    fill_in 'title', with: 'Chelsea'
    fill_in 'url', with: 'www.chelsea.com'
    fill_in 'tag', with: "losers"
    click_button 'Submit'
    visit '/links/new'
    fill_in 'title', with: 'Bubblio'
    fill_in 'url', with: 'www.bubblio.com'
    fill_in 'tag', with: "bubbles"
    click_button 'Submit'
    visit '/links/new'
    fill_in 'title', with: 'Man_City'
    fill_in 'url', with: 'www.city.com'
    fill_in 'tag', with: "losers"
    click_button 'Submit'
    visit '/tags/bubbles'
    expect(page.status_code).to eq 200
    expect(page).to have_content("bubbles")
    expect(page).not_to have_content("losers")
  end
end
