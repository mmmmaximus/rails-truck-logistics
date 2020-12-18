require 'rails_helper'
require 'cancan/matchers'

describe Ability do
  describe '.initialize' do
    subject { Ability.new(user) }

    context 'user is not logged in' do
      let(:user) { nil }

      it { is_expected.to be_able_to(:read, Truck, Driver, Route, Cargo, ModelType) }
    end

    context 'user is logged in' do
      let(:user) { create(:admin) }

      it { is_expected.to be_able_to(:manage, :all) }
    end
  end
end
