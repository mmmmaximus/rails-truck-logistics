require 'rails_helper'

describe "Trains" do
  describe "GET /index" do
    it "returns http success" do
      get trains_path
      expect(response).to be_successful
    end
  end
end
