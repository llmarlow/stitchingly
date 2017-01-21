require "rails_helper"

RSpec.feature "Visit Homepage", :type => :feature do
  it "should allow new user visits the homepage" do
    visit "/"
    expect(page).to have_text("Letting you focus on the stitching!")
  end

  it should 'allow a user to log in' do
    before do
      visit '/users/sign_in'
      user = FactoryGirl.create(:admin)
      #user.add_role :admin
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_on 'Sign in'
    end
    it { should have_link 'Logout' }
    expect(page).to have_text("DMC Threads")
  end
end