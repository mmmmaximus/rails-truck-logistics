require 'rails_helper'

describe Truck do
  describe 'validations with shoulda-matchers' do
    subject { build(:truck) }

    it { is_expected.to validate_presence_of(:license_plate) }
    it { is_expected.to validate_presence_of(:capacity) }
    it { is_expected.to define_enum_for(:status).with_values(Truck.statuses.keys) }
    it { is_expected.to have_many(:driver_trucks).dependent(:destroy) }
    it { is_expected.to have_many(:drivers).through(:driver_trucks) }
    it { is_expected.to have_many(:cargos).dependent(:destroy) }
    it { is_expected.to have_many(:routes).dependent(:destroy) }
    it { is_expected.to belong_to(:model_type) }
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
