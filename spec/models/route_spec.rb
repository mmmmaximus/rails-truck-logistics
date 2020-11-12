require 'rails_helper'

describe Route do
  describe 'route validations' do
    subject { build(:route) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:length_of_time) }
    it 'validates numericality' do
      expect(subject).to validate_numericality_of(:length_of_time).
        is_greater_than_or_equal_to(1).
        is_less_than_or_equal_to(500)
    end
  end
end
