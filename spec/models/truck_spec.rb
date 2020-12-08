require 'rails_helper'

describe Truck do
  describe 'validations' do
    subject { truck.valid? }

    let(:truck) do
      build(:truck, license_plate: license_plate, capacity: capacity, status: status)
    end
    let(:license_plate) { '1234' }
    let(:capacity) { 100 }
    let(:status) { :active }

    context 'license plate is not present' do
      let(:license_plate) { '' }

      it { is_expected.to be_falsey }
    end

    context 'capacity is not present' do
      let(:capacity) { nil }

      it { is_expected.to be_falsey }
    end

    context 'status is not present' do
      let(:status) { nil }

      it { is_expected.to be_falsey }
    end

    it { is_expected.to be_truthy }
  end

  describe 'validations with shoulda-matchers' do
    it { is_expected.to validate_presence_of(:license_plate) }
    it { is_expected.to validate_presence_of(:capacity) }
    it { is_expected.to define_enum_for(:status).with_values(Truck.statuses.keys) }
  end

  describe '.driver_name' do
    subject { truck.driver_name }

    context 'single driver' do
      let(:truck) { create(:truck, drivers: drivers) }
      let(:drivers) { [create(:driver)] }

      it { is_expected.to eq(drivers.first.name) }
    end

    context 'many drivers' do
      let(:truck) { create(:truck, drivers: drivers) }
      let(:drivers) { create_list(:driver, 2) }

      it { is_expected.to eq("#{drivers.first.name}, #{drivers.last.name}") }
    end
  end

  describe '.route_name' do
    subject { truck.route_name }

    context 'single route' do
      let(:truck) { create(:truck, routes: routes) }
      let(:routes) { [create(:route)] }

      it { is_expected.to eq(routes.first.name) }
    end

    context 'many routes' do
      let(:truck) { create(:truck, routes: routes) }
      let(:routes) { create_list(:route, 2) }

      it { is_expected.to eq("#{routes.first.name}, #{routes.last.name}") }
    end
  end

  describe '.cargo_name' do
    subject { truck.cargo_name }

    context 'single cargo' do
      let(:truck) { create(:truck, cargos: cargos) }
      let(:cargos) { [create(:cargo)] }

      it { is_expected.to eq(cargos.first.title) }
    end

    context 'many cargos' do
      let(:truck) { create(:truck, cargos: cargos) }
      let(:cargos) { create_list(:cargo, 2) }

      it { is_expected.to eq("#{cargos.first.title}, #{cargos.last.title}") }
    end
  end

  describe '.model_type_name' do
    subject { truck.model_type_name }

    let(:truck) { create(:truck, model_type: model_type) }
    let(:model_type) { create(:model_type) }

    it { is_expected.to eq(model_type.name) }
  end
end
