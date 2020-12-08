require 'rails_helper'

describe ModelType do
  describe 'model_type validations' do
    subject { build(:model_type) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:brand) }
  end

  describe '.truck_name' do
    subject { model_type.truck_name }

    let(:model_type) { create(:model_type) }

    it { is_expected.to eq(model_type.trucks.map{ |truck| truck.license_plate }.join(', ')) }
  end
end
