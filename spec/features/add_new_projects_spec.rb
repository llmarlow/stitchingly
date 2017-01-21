require 'rails_helper'

feature "AddNewProjects", :type => :feature do
  it "should allow a loged in user to add a project" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit new_project_path
    fill_in "Name", with: "Project title"

    click_link_or_button "Create Project"

    expect( Project.count ).to eq(1)
  end

  it "Should not allow a user who is not signed in to add a project" do
    visit new_project_path
    expect(page).to have_text("You need to sign in or sign up before continuing.")
  end
end