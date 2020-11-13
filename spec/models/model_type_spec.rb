require 'rails_helper'

describe ModelType do
  describe 'model_type validations' do
    subject { build(:model_type) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:brand) }
  end
end
