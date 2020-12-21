require 'rails_helper'

describe "Trucks" do
  # create truck and attributes for create and update
  let(:truck) { create(:truck) }
  let(:valid_attributes) do
    { license_plate: "license_plate", capacity: 1, model_type: truck.model_type, color: "color", service_date: truck.service_date, status: truck.status }
  end
  let(:invalid_attributes) do
    { license_plate: "", capacity: "", model_type: nil, color: "", service_date: nil, status: nil }
  end

  # log user in
  let(:admin) { create(:admin) }
  before do
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(admin_id: admin.id)
  end

  describe "GET /index" do
    it "returns http success" do
      get trucks_path
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_truck_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid attributes" do
      it "creates new truck and render successful response" do
        expect {
          post trucks_path, params: { truck: valid_attributes }
        }.to change(Truck, :count).by(1)
        expect(response).to be_successful
      end
    end

    context "with valid attributes" do
      it "does not create new truck and renders successful response" do
        expect {
          post trucks_path, params: { truck: invalid_attributes }
        }.to change(Truck, :count).by(0)
        expect(response).to_not render_template(:index)
        expect(response).to render_template(:new)
        expect(response).to be_successful
      end
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_truck_path(truck)
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates truck with valid attributes and redirect to index" do
        patch truck_path(truck), params: { truck: valid_attributes }
        truck.reload
        expect(truck.license_plate).to eq(valid_attributes[:license_plate])
        expect(response).to redirect_to trucks_path
      end
    end

    context "with invalid parameters" do
      it "updates truck with invalid attributes and renders successful response" do
        patch truck_path(truck), params: { truck: invalid_attributes }
        expect(response).to_not render_template(:index)
        expect(response).to render_template(:edit)
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:existing_truck) { create(:truck) }

    it "deletes truck and redirects to index" do
      expect {
        delete truck_path(existing_truck)
      }.to change(Truck, :count).by(-1)
      expect(response).to redirect_to(trucks_path)
    end
  end
end
