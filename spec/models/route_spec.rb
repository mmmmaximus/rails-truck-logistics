require 'rails_helper'

describe Route do
  describe 'route validations' do
    subject { route.valid? }

    let(:route) do
      build(
        :route,
        name: name,
        length_of_time: length_of_time
      )
    end
    let(:name) { 'some name' }
    let(:length_of_time) { 100 }

    it { is_expected.to be_truthy }

    subject { build(:route) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:length_of_time) }
    it { is_expected.to validate_numericality_of(:length_of_time).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(500) }
  end
end
