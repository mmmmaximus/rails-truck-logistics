require 'rails_helper'

describe "Routes" do
  describe "GET /index" do
    it "returns http success" do
      get "/routes"
      expect(response).to have_http_status(:success)
    end
  end
end
