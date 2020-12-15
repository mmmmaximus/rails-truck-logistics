require 'rails_helper'

describe Admin do
  describe 'admin validations' do
    subject { build(:admin) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:email) }
  end
end
