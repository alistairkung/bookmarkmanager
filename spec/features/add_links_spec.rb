feature 'adding links' do

  scenario 'I would like to be able to add links to the website' do
    visit '/links/new'
    fill_in 'title', with: 'BBC'
    fill_in 'url', with: 'http://www.bbc.co.uk/'
    click_button 'Submit'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('BBC')
    end
  end
end
