class User < ApplicationRecord
  validates :email, :name, :role, presence: true
end
