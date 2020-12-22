require 'rails_helper'

describe "Sessions" do
  describe "GET /new" do
    it "returns http success" do
      get new_session_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post sessions_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /destroy" do
    let(:admin) { create(:admin) }

    before do
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(admin_id: admin.id)
    end

    it "returns http success" do
      delete session_path(admin)
      expect(response).to redirect_to(root_path)
    end
  end
end
