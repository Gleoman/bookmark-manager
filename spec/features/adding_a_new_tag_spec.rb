
feature 'tagging links' do
  scenario 'adding a tag to a link' do
    visit '/links/new'
    fill_in 'title', with: 'Arsenal'
    fill_in 'url', with: 'www.arsenal.com'
    fill_in 'tag', with: "football"
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include("football")
  end

  scenario 'adding multiple tags to a link' do
    visit '/links/new'
    fill_in 'title', with: 'Arsenal'
    fill_in 'url', with: 'www.arsenal.com'
    fill_in 'tag', with: "football, London, Emirates"
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include("London")
    expect(link.tags.map(&:name)).not_to include("losers")
  end
end
