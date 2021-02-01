require 'rails_helper'

describe "User Authentication" do
  before(:each) do
    @user = User.create(name: 'Murphy', email: 'email@example.com', password: 'password')
  end

  it 'User can login with correct credentials' do
    visit '/login'
    fill_in :email, with: 'email@example.com'
    fill_in :password, with: 'password'
    click_on 'Login'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Welcome back #{@user.name}")
  end

  it 'User cannot login with incorrect credentials' do
    visit '/login'
    fill_in :email, with: 'user@example.com'
    fill_in :password, with: 'incorrect password'
    click_on 'Login'

    expect(current_path).to eq('/login')
    expect(page).to have_content('Email or password incorrect')
  end
end
