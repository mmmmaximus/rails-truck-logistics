class Driver < ApplicationRecord
  has_many :driver_trucks, dependent: :destroy
  has_many :trucks, through: :driver_trucks

  validates :name, presence: true
  validates :license_number, presence: true
  validates :mobile_number, presence: true, phone: true
  validates :email_address, presence: true, email: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 18, less_than_or_equal_to: 74 }
  validates :status, inclusion: { in: [ true, false ] }

  def truck_name
    trucks.map{ |truck| truck.license_plate }.join(', ')
  end
end
