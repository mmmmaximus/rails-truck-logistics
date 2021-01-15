require 'rails_helper'

describe "Trains" do
  let(:valid_attributes) do
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
      expect_any_instance_of(TrainApi).to receive(:index).and_return([valid_attributes])
    end

    it "returns http success" do
      get trains_path
      expect(response).to be_successful
      expect(response.body).to include("1", "name", "train_model_name", "2", "100", "true")
    end
  end

  describe "GET /edit" do
    before do
      expect_any_instance_of(TrainApi).to receive(:show).and_return(valid_attributes)
    end

    it "returns http success" do
      get edit_train_path(1)
      expect(response).to be_successful
    end
  end
end
