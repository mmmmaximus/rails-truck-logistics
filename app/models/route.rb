class Route < ApplicationRecord
  belongs_to :truck

  validates :name, presence: true
  validates :length_of_time, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 500 }
end
