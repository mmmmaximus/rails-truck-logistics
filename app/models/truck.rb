class Truck < ApplicationRecord
  validates :license_plate, presence: true
  validates :capacity, presence: true
  enum status: [ :active, :inactive, :servicing ]

  validates :status, inclusion: { in: Truck.statuses.keys }
end
