class Truck < ApplicationRecord
  has_many :driver_trucks, dependent: :destroy
  has_many :drivers, through: :driver_trucks
  has_many :cargo, dependent: :destroy
  has_many :routes, dependent: :destroy
  belongs_to :model_type

  validates :license_plate, presence: true
  validates :capacity, presence: true
  enum status: [ :active, :inactive, :servicing ]

  validates :status, inclusion: { in: Truck.statuses.keys }

  def model_type_name
    model_type.name
  end

  def driver_name
    drivers.map{ |driver| driver.name }.join(', ')
  end
end
