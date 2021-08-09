require 'rails_helper'

describe Route do
  describe 'route validations' do
    subject { build(:route) }

    it { is_expected.to belong_to(:truck) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:length_of_time) }
    it 'validates numericality' do
      expect(subject).to validate_numericality_of(:length_of_time).
        is_greater_than_or_equal_to(1).
        is_less_than_or_equal_to(500)
    end
  end

  describe '.truck_name' do
    subject { route.truck_name }

    let(:route) { create(:route, truck: truck) }
    let(:truck) { create(:truck) }

    it { is_expected.to eq(truck.license_plate) }
  end
end
