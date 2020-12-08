class Cargo < ApplicationRecord
  belongs_to :truck

  validates :description, presence: true
  validates :title, presence: true
  validates :reference_number, presence: true
  validates :value, presence: true

  def truck_name
    truck.license_plate
  end
end
