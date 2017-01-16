require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "pages#home action" do
    it "should successfully show the page" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end
end
