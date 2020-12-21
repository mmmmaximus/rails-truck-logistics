require 'rails_helper'

describe "Routes" do
  # create route and attributes for create and update
  let(:route) { create(:route) }
  let(:valid_attributes) do
    { name: "name", length_of_time: 100, truck: route.truck }
  end
  let(:invalid_attributes) do
    { name: "", length_of_time: 0 }
  end

  # log user in
  let(:admin) { create(:admin) }
  before do
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(admin_id: admin.id)
  end

  describe "GET /index" do
    it "returns http success" do
      get routes_path
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_route_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid attributes" do
      it "creates new route and renders successful response" do
        expect {
          post routes_path, params: { route: valid_attributes }
        }.to change(Route, :count).by(1)
        expect(response).to be_successful
      end
    end

    context "with valid attributes" do
      it "does not create new route and renders successful response" do
        expect {
          post routes_path, params: { route: invalid_attributes }
        }.to change(Route, :count).by(0)
        expect(response).to_not render_template(:index)
        expect(response).to render_template(:new)
        expect(response).to be_successful
      end
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_route_path(route)
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates route with valid attributes and redirect to index" do
        patch route_path(route), params: { route: valid_attributes }
        route.reload
        expect(route.name).to eq(valid_attributes[:name])
        expect(response).to redirect_to routes_path
      end
    end

    context "with invalid parameters" do
      it "updates route with invalid attributes and renders successful response" do
        patch route_path(route), params: { route: invalid_attributes }
        expect(response).to_not render_template(:index)
        expect(response).to render_template(:edit)
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:existing_route) { create(:route) }

    it "deletes route and redirects to index" do
      expect {
        delete route_path(existing_route)
      }.to change(Route, :count).by(-1)
      expect(response).to redirect_to(routes_path)
    end
  end
end
