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
end
