require 'rails_helper'

describe Admin do
  describe 'admin' do
    context 'validations' do
      subject { build(:admin) }
      it { is_expected.to be_valid }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_length_of(:password).is_at_least(8) }
    end

    context 'password presence validation' do
      let(:password) { nil }
      it { is_expected.to validate_presence_of(:password) }
    end
  end
end
