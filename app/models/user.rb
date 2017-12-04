class User < ApplicationRecord
  include UserAuthConcern

  has_secure_password

  validates :email, :name, :role, :password, presence: true

  has_and_belongs_to_many :stacks
  has_many :subscriptions_users

  def reviewers
    self.class.joins(:subscriptions_users).where(subscriptions_users: { kind: 'review', user_id: id })
  end

  def reviewer_ids
    reviewers.ids
  end

  def reviewer_by_stack(stack_id)
    reviewers.find_by(subscriptions_users: { stack_id: stack_id } )
  end

  def reviewees
    self.class.joins(:subscriptions_users).where(subscriptions_users: { kind: 'review', subscriber_id: id })
  end

  def reviewee_ids
    reviewees.ids
  end

  def subscribers
    self.class.joins(:subscriptions_users).where(subscriptions_users: { kind: 'watch', user_id: id })
  end

  def subscriber_ids
    subscribers.ids
  end
end
