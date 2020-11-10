class Truck < ApplicationRecord
  validates :license_plate, presence: true
  validates :capacity, presence: true
  enum status: [ :active, :inactive, :servicing ]

  validates_inclusion_of :status, in: Truck.statuses.keys
end
