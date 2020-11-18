require 'rails_helper'

describe "Trucks" do
  describe "GET /index" do
    it "returns http success" do
      get "/trucks"
      expect(response).to have_http_status(:success)
    end
  end
end
