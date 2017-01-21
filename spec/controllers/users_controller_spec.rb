require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {
      { "email" => "lornamarlow@hotmail.co.uk", "password" => "password", "password_confirmation" => "password" }
    }

  let(:valid_session) { {} }
    
  describe "GET #index" do
    it "assigns all users as @users" do
      user = User.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :show, params: {id: user.to_param}, session: valid_session
      expect(assigns(:user)).to eq(user)
    end
  end
end
