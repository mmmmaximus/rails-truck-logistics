require 'rails_helper'

RSpec.describe "Drivers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/startup/index"
      expect(response).to have_http_status(:success)
    end
  end
end
