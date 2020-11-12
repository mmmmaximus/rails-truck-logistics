class Truck < ApplicationRecord
  has_many :driver_trucks, dependent: :destroy
  has_many :drivers, through: :driver_trucks
  has_many :cargo, dependent: :destroy
  has_many :routes, dependent: :destroy

  validates :license_plate, presence: true
  validates :capacity, presence: true
  enum status: [ :active, :inactive, :servicing ]

  validates :status, inclusion: { in: Truck.statuses.keys }
end
