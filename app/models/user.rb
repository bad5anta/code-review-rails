class User < ApplicationRecord
  include UserAuthConcern

  has_secure_password

  validates :email, :name, :role, :password, presence: true

  has_and_belongs_to_many :stacks
end
