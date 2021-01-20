require 'rails_helper'

describe "Trains" do
  let(:response_double) { double }
  let(:train) do
    {
      "id" => 1,
      "name" => "name",
      "train_model_name" => "train_model_name",
      "number_of_cars" => 2,
      "max_weight_capacity" => 100,
      "active" => true
    }
  end

  describe "GET /index" do
    before do
      expect_any_instance_of(TrainApi).to receive(:index).and_return([train])
    end

    it "returns http success" do
      get trains_path
      expect(response).to be_successful
      expect(response.body).to include("1", "name", "train_model_name", "2", "100", "true")
    end
  end

  describe "GET /create" do
    before do
      expect_any_instance_of(TrainApi).to receive(:new).and_return({})
    end

    it "returns http success" do
      get new_train_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    before do
      expect_any_instance_of(TrainApi).to receive(:show).and_return(train)
    end

    it "returns http success" do
      get edit_train_path(1)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    before do
      expect_any_instance_of(TrainApi).to receive(:create).and_return(response_double)
      expect(response_double).to receive(:[]).and_return([{ values: [] }])
    end

    context "with valid parameters" do
      before { expect(response_double).to receive(:success?).and_return(true) }

      it "redirect to index" do
        post trains_path(params: { train: train })
        expect(response).to redirect_to trains_path
      end
    end

    context "with invalid parameters" do
      before { expect(response_double).to receive(:success?).and_return(false) }

      it "does not redirect to index" do
        post trains_path(params: { train: train })
        expect(response).to_not render_template(:index)
        expect(response).to render_template(:new)
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    before do
      expect_any_instance_of(TrainApi).to receive(:update).and_return(response_double)
      expect(response_double).to receive(:[]).and_return([{ values: [] }])
    end

    context "with valid parameters" do
      before { expect(response_double).to receive(:success?).and_return(true) }

      it "redirect to index" do
        patch train_path(train["id"], params: { train: train })
        expect(response).to redirect_to trains_path
      end
    end

    context "with invalid parameters" do
      before { expect(response_double).to receive(:success?).and_return(false) }

      it "does not redirect to index" do
        patch train_path(train["id"], params: { train: train })
        expect(response).to_not render_template(:index)
        expect(response).to render_template(:edit)
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    let(:response_double) { double }
    before do
      expect_any_instance_of(TrainApi).to receive(:destroy).and_return(response_double)
      allow_any_instance_of(TrainApi).to receive(:index).and_return([])
    end

    context "delete success" do
      before do
        expect(response_double).to receive(:success?).and_return(true)
        expect(response_double).to receive(:[]).and_return("#{train['name']} successfully deleted")
      end

      it "redirects to index" do
        delete train_path(1)
        expect(response).to redirect_to(trains_path)
        follow_redirect!
        expect(response.parsed_body).to include("name successfully deleted")
      end
    end

    context "delete failure" do
      before { expect(response_double).to receive(:success?).and_return(false) }

      it "does not redirect to index" do
        delete train_path(1)
        expect(response).to redirect_to(trains_path)
        follow_redirect!
        expect(response.parsed_body).to include("Oops, Something went wrong!")
      end
    end
  end
end
