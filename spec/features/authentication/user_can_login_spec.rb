require 'rails_helper'

describe "User Authentication" do
  before(:each) do
    @user = User.create(name: 'Murphy', email: 'email@example.com', password: 'password')
  end

  it "User can login with correct credentials" do
    # As an unauthenticated user, when I visit `/login`
    visit '/login'
    # and fill in the `email` field with my email and the `password` field with my password,
    fill_in :email, with: 'user@example.com'
    fill_in :password, with: 'password'
    # then click the `Login` button, I am logged in.
    click_on 'Login'
    # I am redirected to the `/dashboard` where I see a flash message `Welcome back <my_username>!`
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Welcome back #{@user.name}")
  end
end
