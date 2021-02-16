class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable

  validates :description, presence: true
  validates :title, presence: true

  scope :order_by_recent, -> { order(created_at: :desc) }
end
