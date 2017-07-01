def add_link(args)
  visit('/links/new')
  fill_in('url', with: args[:url])
  fill_in('title', with: args[:title])
  fill_in('tags', with: args[:tag])
  click_button("Submit")
end

def sign_up(email: "johnsmith@aol.com",
            password: "password123",
            password_confirmation: "password123")
  visit '/users/new'
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  fill_in(:password_confirmation, with: password_confirmation)
  click_button("Sign up")
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
