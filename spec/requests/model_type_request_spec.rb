require 'rails_helper'

describe "Model_types" do
  describe "GET /index" do
    it "returns http success" do
      get "/model_types"
      expect(response).to have_http_status(:success)
    end
  end
end
