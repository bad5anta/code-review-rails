class Diff < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :reviewer, class_name: 'User'
  belongs_to :stack
end
