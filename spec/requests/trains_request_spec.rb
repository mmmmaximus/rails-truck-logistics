require 'rails_helper'

describe "Trains" do
  before do
    expect_any_instance_of(TrainApi).to receive(:index).and_return(
      [{
        "id" => 1,
        "name" => "name",
        "train_model_name" => "train_model_name",
        "number_of_cars" => 2,
        "max_weight_capacity" => 100,
        "active" => true
      }]
    )
  end

  describe "GET /index" do
    it "returns http success" do
      get trains_path
      expect(response).to be_successful
      expect(response.body).to include("1", "name", "train_model_name", "2", "100", "true")
    end
  end
end
