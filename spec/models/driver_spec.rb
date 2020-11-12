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

    context 'age is not valid' do
      let(:age) { 2 }

      it { is_expected.to be_falsey }
    end
  end

  describe 'driver validations with shoulda matchers' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:license_number) }
    it { is_expected.to validate_presence_of(:mobile_number) }
    it { is_expected.to validate_presence_of(:email_address) }
    it { is_expected.to validate_presence_of(:age) }
    it { is_expected.to validate_presence_of(:status) }
  end
end
