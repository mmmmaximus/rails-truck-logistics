require 'rails_helper'

describe "Cargos" do
  describe "GET /index" do
    it "returns http success" do
      get "/cargos"
      expect(response).to have_http_status(:success)
    end
  end
end
