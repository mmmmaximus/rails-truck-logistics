require 'rails_helper'

describe "Drivers" do
  # create driver and attributes for create and update
  let(:driver) { create(:driver) }
  let(:valid_attributes) do
    { name: "name", license_number: "license_number", mobile_number: "12345", email_address: "email@email", age: 21, status: false }
  end
  let(:invalid_attributes) do
    { name: "", license_number: "", mobile_number: "", email_address: "invalid_email", age: 1, status: false }
  end

  # log user in
  let(:admin) { create(:admin) }
  before do
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(admin_id: admin.id)
  end

  describe "GET /index" do
    it "returns http success" do
      get drivers_path
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_driver_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates new driver and redirects to index" do
        expect {
          post drivers_path, params: { driver: valid_attributes }
        }.to change(Driver, :count).by(1)
        expect(response).to redirect_to drivers_path
      end
    end

    context "with invalid parameters" do
      it "does not create new driver and renders successful response" do
        expect {
          post drivers_path, params: { driver: invalid_attributes }
        }.to change(Driver, :count).by(0)
        expect(response).to_not render_template(:index)
        expect(response).to render_template(:new)
        expect(response).to be_successful
      end
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_driver_path(driver)
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates driver with valid attributes and redirects to index" do
        patch driver_path(driver), params: { driver: valid_attributes }
        driver.reload
        expect(driver.name).to eq(valid_attributes[:name])
        expect(response).to redirect_to drivers_path
      end
    end

    context "with invalid parameters" do
      it "updates driver with invalid attributes and renders successful ressponse" do
        patch driver_path(driver), params: { driver: invalid_attributes }
        expect(response).to_not render_template(:index)
        expect(response).to render_template(:edit)
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:existing_driver) { create(:driver) }

    it "deletes driver and redirects to index" do
      expect {
        delete driver_path(existing_driver)
      }.to change(Driver, :count).by(-1)
      expect(response).to redirect_to(drivers_path)
    end
  end
end
