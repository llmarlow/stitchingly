require 'rails_helper'

RSpec.describe UserFlossesController, type: :controller do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @floss = FactoryGirl.create(:floss)
  end
  let(:valid_attributes) { { "floss_quantity" => 2, "floss_id" => @floss.id, "user_id" => @user.id } }

  let(:invalid_attributes) { { "floss_quantity" => "2", "user_id" => @user.id } }
    

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UserFlossesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all user_flosses as @user_flosses" do
      user_floss = UserFloss.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:user_flosses)).to eq([user_floss])
    end
  end

  describe "GET #show" do
    it "assigns the requested user_floss as @user_floss" do
      user_floss = UserFloss.create! valid_attributes
      get :show, params: {id: user_floss.to_param}, session: valid_session
      expect(assigns(:user_floss)).to eq(user_floss)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new UserFloss" do
        expect {
          post :create, params: {user_floss: valid_attributes}, session: valid_session
        }.to change(UserFloss, :count).by(1)
      end

      it "assigns a newly created user_floss as @user_floss" do
        post :create, params: {user_floss: valid_attributes}, session: valid_session
        expect(assigns(:user_floss)).to be_a(UserFloss)
        expect(assigns(:user_floss)).to be_persisted
      end

      it "redirects to the flosses_path" do
        post :create, params: {user_floss: valid_attributes}, session: valid_session
        expect(response).to redirect_to flosses_path
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user_floss as @user_floss" do
        post :create, params: {user_floss: invalid_attributes}, session: valid_session
        expect(assigns(:user_floss)).to be_a_new(UserFloss)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { "floss_quantity" => 5, "floss_id" => @floss.id, "user_id" => @user.id }
      }

      it "updates the requested user_floss" do
        user_floss = UserFloss.create! valid_attributes
        put :update, params: {id: user_floss.to_param, user_floss: new_attributes}, session: valid_session
        user_floss.reload
        expect(user_floss.attributes).to include( { "floss_quantity" => 5 } )
      end

      it "assigns the requested user_floss as @user_floss" do
        user_floss = UserFloss.create! valid_attributes
        put :update, params: {id: user_floss.to_param, user_floss: valid_attributes}, session: valid_session
        expect(assigns(:user_floss)).to eq(user_floss)
      end

      it "redirects to the flosses_path" do
        user_floss = UserFloss.create! valid_attributes
        put :update, params: {id: user_floss.to_param, user_floss: valid_attributes}, session: valid_session
        expect(response).to redirect_to flosses_path
      end
    end

    context "with invalid params" do
      it "assigns the user_floss as @user_floss" do
        user_floss = UserFloss.create! valid_attributes
        put :update, params: {id: user_floss.to_param, user_floss: invalid_attributes}, session: valid_session
        expect(assigns(:user_floss)).to eq(user_floss)
      end
    end
  end

end
