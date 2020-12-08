require 'rails_helper'

describe Driver do
  describe 'driver validations' do
    subject { driver.valid? }

    let(:driver) do
      build(
        :driver,
        name: name,
        license_number: license_number,
        mobile_number: mobile_number,
        email_address: email_address,
        age: age,
        status: status
      )
    end
    let(:name) { 'some name' }
    let(:license_number) { 'license_number' }
    let(:mobile_number) { '98765432' }
    let(:email_address) { 'email@email.com' }
    let(:age) { 18 }
    let(:status) { true }

    it { is_expected.to be_truthy }

    context 'mobile number' do
      context 'non singapore number' do
        let(:mobile_number) { '0412345678' }

        it { is_expected.to be_falsey }
      end

      context 'singapore number' do
        let(:mobile_number) { '98765432' }

        it { is_expected.to be_truthy }
      end
    end

    context 'email address' do
      context 'is not valid' do
        let(:email_address) { '1.2' }

        it { is_expected.to be_falsey }
      end

      context 'is valid' do
        let(:email_address) { '1@2.3' }

        it { is_expected.to be_truthy }
      end
    end
  end

  subject { build(:driver) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:license_number) }
  it { is_expected.to validate_presence_of(:mobile_number) }
  it { is_expected.to validate_presence_of(:email_address) }
  it { is_expected.to validate_presence_of(:age) }
  it { is_expected.to validate_numericality_of(:age).is_greater_than_or_equal_to(18).is_less_than_or_equal_to(74) }

  describe '.truck_name' do
    subject { driver.truck_name }

    context 'single truck' do
      let(:driver) { create(:driver, trucks: trucks) }
      let(:trucks) { [create(:truck)] }

      it { is_expected.to eq("#{trucks.first.license_plate}") }
    end

    context 'many trucks' do
      let(:driver) { create(:driver, trucks: trucks) }
      let(:trucks) { create_list(:truck, 2)}

      it { is_expected.to eq("#{trucks.first.license_plate}, #{trucks.last.license_plate}") }
    end
  end
end
