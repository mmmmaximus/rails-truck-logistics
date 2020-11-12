class DriverTruck < ApplicationRecord
  belongs_to :truck
  belongs_to :driver
end
