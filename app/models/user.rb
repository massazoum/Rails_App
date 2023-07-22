# app/models/user.rb
class User < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Associations
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  # Method to retrieve the 3 most recent posts for a user
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def update_posts_counter
    update(post_counter: posts.count)
  end
end
