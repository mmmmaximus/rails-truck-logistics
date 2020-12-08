class ModelType < ApplicationRecord
  has_many :trucks

  validates :name, presence: true
  validates :brand, presence: true

  def truck_name
    trucks.map{ |truck| truck.license_plate }.join(', ')
  end
end
