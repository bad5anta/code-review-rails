class SubscriptionsUser < ApplicationRecord
  belongs_to :user
  belongs_to :subscriber, class_name: 'User'
  belongs_to :stack

  scope :reviewers, ->(user_id) { where(kind: 'review', user_id: user_id) }
  scope :reviewee, ->(user_id) { where(kind: 'review', subscriber_id: user_id) }
  scope :subscribers, ->(user_id) { where(kind: 'watch', user_id: user_id) }

  enum kind: { watch: 0, review: 1 }

  validates :kind, presence: true
end
