require 'rails_helper'

describe "Cargos" do
  # create cargo and attributes for create and update
  let(:cargo) { create(:cargo) }
  let(:valid_attributes) do
    {
      description: "description",
      title: "title",
      reference_number: 0,
      value: 0.0,
      truck: cargo.truck,
      paid: cargo.paid
    }
  end
  let(:invalid_attributes) do
    {
      description: "",
      title: "",
      reference_number: "",
      value: ""
    }
  end

  # log user in
  let(:admin) { create(:admin) }
  before do
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(admin_id: admin.id)
  end

  describe "GET /index" do
    it "returns http success" do
      get cargos_path
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_cargo_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates new cargo and renders successful response" do
        expect {
          post cargos_path, params: { cargo: valid_attributes }
        }.to change(Cargo, :count).by(1)
        expect(response).to be_successful
      end
    end

    context "with invalid parameters" do
      it "does not create new cargo and renders successful response" do
        expect {
          post cargos_path, params: { cargo: invalid_attributes }
        }.to change(Cargo, :count).by(0)
        expect(response).to_not render_template(:index)
        expect(response).to render_template(:new)
        expect(response).to be_successful
      end
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_cargo_path(cargo)
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates cargo with valid attributes and redirect to index" do
        patch cargo_path(cargo), params: { cargo: valid_attributes }
        cargo.reload
        expect(cargo.description).to eq(valid_attributes[:description])
        expect(response).to redirect_to cargos_path
      end
    end

    context "with invalid parameters" do
      it "updates cargo with invalid attributes and renders successful response" do
        patch cargo_path(cargo), params: { cargo: invalid_attributes }
        expect(response).to_not render_template(:index)
        expect(response).to render_template(:edit)
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:existing_cargo) { create(:cargo) }

    it "deletes cargo and redirects to index" do
      expect {
        delete cargo_path(existing_cargo)
      }.to change(Cargo, :count).by(-1)
      expect(response).to redirect_to(cargos_path)
    end
  end
end
