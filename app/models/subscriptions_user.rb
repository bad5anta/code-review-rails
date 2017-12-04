class SubscriptionsUser < ApplicationRecord
  belongs_to :user
  belongs_to :watcher, foreign_key: :watcher_id, class_name: 'User'
  belongs_to :stack

  enum kind: { watch: 0, review: 1 }

  validates :kind, presence: true
end
