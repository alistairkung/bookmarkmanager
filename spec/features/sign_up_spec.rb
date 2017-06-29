feature "sign up" do
  scenario "filling out sign up form" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome johnsmith@aol.com")
    expect(User.first.email).to eq('johnsmith@aol.com')
  end

  scenario "with a password that does not match" do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/signup')
    expect(page).to have_content "Password and confirmation password do not match"
  end
end
