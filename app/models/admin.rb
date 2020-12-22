class Admin < ApplicationRecord
  self.table_name = 'admins'

  has_secure_password

  validates :email, presence: true, uniqueness: true, email: true
  validates :password, length: { minimum: 8 }
end
