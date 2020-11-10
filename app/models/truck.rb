class Truck < ApplicationRecord
  validates :license_plate, presence: true
  validates :capacity, presence: true
end
