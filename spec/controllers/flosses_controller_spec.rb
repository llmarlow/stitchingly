require 'rails_helper'

RSpec.describe FlossesController, type: :controller do
  describe "flosses#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
