require 'rails_helper'

describe Cargo do
  describe 'cargo validations' do
    subject { build(:cargo) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:reference_number) }
    it { is_expected.to validate_presence_of(:value) }
  end

  describe '.truck_name' do
    subject { cargo.truck_name }

    let(:cargo) { create(:cargo, truck: truck) }
    let(:truck) { create(:truck) }

    it { is_expected.to eq(truck.license_plate) }
  end
end
