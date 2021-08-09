require 'rails_helper'

describe ModelType do
  describe 'model_type validations' do
    subject { build(:model_type) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:brand) }
    it { is_expected.to have_many(:trucks).dependent(:destroy) }
  end

  describe '.truck_name' do
    subject { model_type.truck_name }

    context 'single model type' do
      let(:model_type) { create(:model_type, trucks: trucks) }
      let(:trucks) { [create(:truck)] }

      it { is_expected.to eq(trucks.first.license_plate) }
    end

    context 'many model types' do
      let(:model_type) { create(:model_type, trucks: trucks) }
      let(:trucks) { create_list(:truck, 2) }

      it { is_expected.to eq("#{trucks.first.license_plate}, #{trucks.last.license_plate}") }
    end
  end
end
