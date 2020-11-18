require 'rails_helper'

describe ApplicationHelper do
  describe 'model_attributes' do
    subject { helper.model_attributes(klass) }
    let(:klass) { Truck }
    let(:expected_array) do
      # put something in here to verify it
      ["id", "license_plate", "capacity", "color", "service_date", "status"]
    end

    it { is_expected.to eq(expected_array) }
  end
end
