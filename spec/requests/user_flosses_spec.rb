require 'rails_helper'

RSpec.describe "UserFlosses", type: :request do
  describe "GET /user_flosses" do
    it "works! (now write some real specs)" do
      get user_flosses_path
      expect(response).to have_http_status(200)
    end
  end
end
