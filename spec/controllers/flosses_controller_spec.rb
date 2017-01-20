require 'rails_helper'

RSpec.describe FlossesController, type: :controller do

  let(:valid_attributes) { { "colour" => "White" } }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all flosses as @flosses" do
      floss = Floss.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:flosses)).to eq([floss])
    end
  end

end

