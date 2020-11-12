class Cargo < ApplicationRecord
  validates :description, presence: true
  validates :title, presence: true
  validates :reference_number, presence: true
  validates :value, presence: true
end
