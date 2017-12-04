class User < ApplicationRecord
  has_secure_password

  validates :email, :name, :role, :password, presence: true
end
