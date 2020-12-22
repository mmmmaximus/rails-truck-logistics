require 'rails_helper'

describe "Model_types" do
  # create model_type and attributes for create and update
  let(:model_type) { create(:model_type) }
  let(:valid_attributes) do
    { name: "name", brand: "brand" }
  end
  let(:invalid_attributes) do
    { name: "", brand: "" }
  end

  # log user in
  let(:admin) { create(:admin) }
  before do
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(admin_id: admin.id)
  end

  describe "GET /index" do
    it "returns http success" do
      get model_types_path
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_model_type_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid attributes" do
      it "creates new model_type and redirect to index" do
        expect {
          post model_types_path, params: { model_type: valid_attributes }
        }.to change(ModelType, :count).by(1)
        expect(response).to redirect_to model_types_path
      end
    end

    context "with valid attributes" do
      it "does not create new model_type and renders successful response" do
        expect {
          post model_types_path, params: { model_type: invalid_attributes }
        }.to change(ModelType, :count).by(0)
        expect(response).to_not render_template(:index)
        expect(response).to render_template(:new)
        expect(response).to be_successful
      end
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_model_type_path(model_type)
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates model_type with valid attributes and redirect to index" do
        patch model_type_path(model_type), params: { model_type: valid_attributes }
        model_type.reload
        expect(model_type.name).to eq(valid_attributes[:name])
        expect(response).to redirect_to model_types_path
      end
    end

    context "with invalid parameters" do
      it "updates model_type with invalid attributes and renders successful response" do
        patch model_type_path(model_type), params: { model_type: invalid_attributes }
        expect(response).to_not render_template(:index)
        expect(response).to render_template(:edit)
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:existing_model_type) { create(:model_type) }

    it "deletes model_type and redirects to index" do
      expect {
        delete model_type_path(existing_model_type)
      }.to change(ModelType, :count).by(-1)
      expect(response).to redirect_to(model_types_path)
    end
  end
end
