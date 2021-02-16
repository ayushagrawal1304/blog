class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_one :comment, as: :commentable

  scope :order_by_recent, -> { order(created_at: :desc) }
end
