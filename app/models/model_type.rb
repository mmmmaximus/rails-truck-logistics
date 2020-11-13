class ModelType < ApplicationRecord
  has_many :trucks

  validates :name, presence: true
  validates :brand, presence: true
end
