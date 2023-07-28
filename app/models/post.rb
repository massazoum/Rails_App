# app/models/post.rb
class Post < ApplicationRecord
  # Validations
  # belongs_to :user
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, allow_nil: true }
  validates :likes_counter, numericality: { only_integer: true, allow_nil: true }

  # Associations
  has_many :comments
  has_many :likes

  # Method to retrieve the 5 most recent comments for a post
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
