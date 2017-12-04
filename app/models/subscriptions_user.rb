class SubscriptionsUser < ApplicationRecord
  belongs_to :user
  belongs_to :subscriber, class_name: 'User'
  belongs_to :stack

  enum kind: { watch: 0, review: 1 }

  validates :kind, presence: true
end
