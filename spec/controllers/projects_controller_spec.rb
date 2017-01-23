require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  before(:each) do
    @project_user = FactoryGirl.create(:user)
    login_with create( :user )
  end

  
  let(:valid_attributes) {
    { "name" => "Name", "notes" => "Lots and lots and lots of notes", "progress" => 55, "status" => "WIP", "user_id" => @project_user.id, "picture" => "picture" }
  }

  let(:invalid_attributes) {
    { "name" => nil, "notes" => "Lots and lots and lots of notes", "progress" => 55, "status" => "WIP" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProjectsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all projects as @projects" do
      project = Project.create! valid_attributes
      get :all, params: {}, session: valid_session
      expect(assigns(:projects)).to eq([project])
    end
  end

  describe "project#show action" do
    it "assigns the requested user as @user" do
      project = Project.create! valid_attributes
      get :show, params: {id: project.to_param, user_id: @project_user}, session: valid_session
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "GET #new" do
    it "assigns a new project as @project" do
      get :new, params: { user_id: @project_user}, session: valid_session
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe "GET #edit" do
    it "assigns the requested project as @project" do
      project = Project.create! valid_attributes
      get :edit, params: {id: project.to_param, user_id: @project_user}, session: valid_session
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Project" do
        expect {
          post :create, params: {project: valid_attributes, user_id: @project_user}, session: valid_session
        }.to change(Project, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        post :create, params: {project: valid_attributes, user_id: @project_user}, session: valid_session
        expect(assigns(:project)).to be_a(Project)
        expect(assigns(:project)).to be_persisted
      end

      it "redirects to the created project" do
        post :create, params: {project: valid_attributes, user_id: @project_user}, session: valid_session
        expect(response).to redirect_to(user_project_path(@project_user, Project.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        post :create, params: {project: invalid_attributes, user_id: @project_user}, session: valid_session
        expect(assigns(:project)).to be_a_new(Project)
      end

      it "re-renders the 'new' template" do
        post :create, params: {project: invalid_attributes, user_id: @project_user}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { "name" => "New Name", "notes" => "Lots and lots and lots of notes", "progress" => 55, "status" => "WIP" }
      }

      it "updates the requested project" do
        project = Project.create! valid_attributes
        put :update, params: {id: project.to_param, project: new_attributes, user_id: @project_user }, session: valid_session
        project.reload
        expect(project.attributes).to include( { "name" => "New Name" } )
      end

      it "assigns the requested project as @project" do
        project = Project.create! valid_attributes
        put :update, params: {id: project.to_param, project: valid_attributes, user_id: @project_user}, session: valid_session
        expect(assigns(:project)).to eq(project)
      end

      it "redirects to the project" do
        project = Project.create! valid_attributes
        put :update, params: {id: project.to_param, project: valid_attributes, user_id: @project_user}, session: valid_session
        expect(response).to redirect_to user_project_path(@project_user, project)
      end
    end

    context "with invalid params" do
      it "assigns the project as @project" do
        project = Project.create! valid_attributes
        put :update, params: {id: project.to_param, project: invalid_attributes, user_id: @project_user}, session: valid_session
        expect(assigns(:project)).to eq(project)
      end

      it "re-renders the 'edit' template" do
        project = Project.create! valid_attributes
        put :update, params: {id: project.to_param, project: invalid_attributes, user_id: @project_user}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested project" do
      project = Project.create! valid_attributes
      expect {
        delete :destroy, params: {:id => project.id, :user_id => @project_user}, session: valid_session
      }.to change(Project, :count).by(-1)
    end

    it "redirects to the projects list" do
      project = Project.create! valid_attributes
      delete :destroy, params: {id: project.to_param, user_id: @project_user}, session: valid_session
      expect(response).to redirect_to(user_projects_path(@project_user))
    end
  end

end
