# require './app/model/link.rb'

feature 'viewing links' do
    scenario 'upon visiting the links page, see a list of links' do

      sign_up
      Link.create(url: "www.bbc.co.uk", title: "bbc homepage")
      visit('/links')

      expect(page.status_code).to eq 200

      within 'ul#links' do
        expect(page).to have_content("bbc homepage")
      end
    end
end
