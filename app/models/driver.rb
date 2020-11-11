class Driver < ApplicationRecord
  validates :name, presence: true
  validates :license_number, presence: true
  validates :mobile_number, presence: true, phone: true
  validates :email_address, presence: true, email: true
  validates :age, presence: true, numericality: { greater_than: 0}
  validates :status, presence: true, inclusion: { in: [ true, false ] }
end
