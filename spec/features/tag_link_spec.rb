feature 'tagging a link' do
  scenario 'I would like to add a tag to to a link' do
    visit '/links/new'
    fill_in 'title', with: 'Google'
    fill_in 'url', with: 'http://www.google.com'
    fill_in 'tags', with: 'Search'

    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('Search')
  end

  scenario 'I can add multiple tags to a link' do
    add_link(title: "Facebook", url:"http://www.facebook.com", tag: "Social Friends")
    link = Link.first
    expect(link.tags.map(&:name)).to include('Social').and include('Friends')
  end
end
