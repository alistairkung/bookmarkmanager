def add_link(args)
  visit('/links/new')
  fill_in('url', with: args[:url])
  fill_in('title', with: args[:title])
  fill_in('tags', with: args[:tag])
  click_button("Submit")
end
