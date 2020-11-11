require 'rails_helper'

describe Truck do
  describe 'validations' do
    subject { truck.valid? }

    let(:truck) do
      build(:truck, :active, license_plate: license_plate, capacity: capacity, status: status)
    end
    let(:license_plate) { '1234' }
    let(:capacity) { 100 }
    let(:status) { :active }

    context 'license plate is not present' do
      let(:license_plate) { '' }

      it { is_expected.to be_falsey }
    end

    context 'capacity is not present' do
      let(:capacity) { nil }

      it { is_expected.to be_falsey }
    end

    context 'status is not present' do
      let(:status) { nil }

      it { is_expected.to be_falsey }
    end

    it { is_expected.to be_truthy }
  end

  describe 'validations with shoulda-matchers' do
    it { is_expected.to validate_presence_of(:license_plate) }
    it { is_expected.to validate_presence_of(:capacity) }
    it { is_expected.to define_enum_for(:status).with_values(Truck.statuses.keys) }
  end
end
