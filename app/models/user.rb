class User < ApplicationRecord
  include UserAuthConcern

  has_secure_password

  validates :email, :name, :role, :password, presence: true

  has_and_belongs_to_many :stacks
  has_many :subscriptions_users

  def reviewers
    subscriptions_users.reviewers(id)
  end

  def reviewee
    subscriptions_users.reviewee(id)
  end

  def subscribers
    subscriptions_users.subscribers(id)
  end
end
