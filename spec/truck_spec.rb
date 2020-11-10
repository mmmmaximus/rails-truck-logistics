require 'rails_helper'

describe Truck do
  describe 'validations' do
    subject { truck.valid? }

    let(:truck) { Truck.new(license_plate: license_plate, capacity: capacity) }
    let(:license_plate) { '1234' }
    let(:capacity) { 100 }

    context 'license plate is not present' do
      let(:license_plate) { '' }

      it { is_expected.to be_false }
    end
    
    context 'capacity is not present' do
      let(:capacity) { nil }

      it { is_expected.to be_false }
    end

    it { is_expected.to be_true }
  end 

  # describe 'validations with shoulda-matchers' do
  #   it { is_expected.to validate_presence_of(:license_plate) }
  #   it { is_expected.to validate_presence_of(:capacity) }
  # end
end
