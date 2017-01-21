require 'rails_helper'

  RSpec.feature "Visit Projects#index", :type => :feature do
    describe "the articles interface" do
      before(:all) do
        @built_projects = build_list(:project, 3)
      end
    end

    describe "on the index page" do
      before(:each) do
        visit projects_path
      end

      it "should list the project names" do
        @built_projects.each do |project|
          page.should have_content(project.name)
        end
      end

      it "should have links for the articles on the index" do
        # Your implementation here
      end
    end
  end
