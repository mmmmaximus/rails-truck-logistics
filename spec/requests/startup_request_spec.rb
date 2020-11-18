require 'rails_helper'

describe "Startups" do
  describe "GET /index" do
    it "returns http success" do
      get "/startup"
      expect(response).to have_http_status(:success)
    end
  end
end
