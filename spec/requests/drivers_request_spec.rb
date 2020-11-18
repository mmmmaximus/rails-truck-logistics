require 'rails_helper'

describe "Drivers" do
  describe "GET /index" do
    it "returns http success" do
      get "/drivers"
      expect(response).to have_http_status(:success)
    end
  end
end
