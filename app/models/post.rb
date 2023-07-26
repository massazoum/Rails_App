# app/models/post.rb
class Post < ApplicationRecord
  # Validations
  # belongs_to :user
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Associations
  has_many :comments
  has_many :likes

  # Method to retrieve the 5 most recent comments for a post
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
