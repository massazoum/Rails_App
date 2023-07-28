class Comment < ApplicationRecord
  # Validations
  validates :text, presence: true

  # Associations
  belongs_to :author, class_name: 'User',  foreign_key: 'author_id'
  belongs_to :post

  # Callback to update the comments counter for the associated post after comment creation or deletion
  after_create :increment_post_comments_counter
  after_destroy :decrement_post_comments_counter

  private

  # Method to increment the comments counter for the associated post
  def increment_post_comments_counter
    post.increment!(:comments_counter)
  end

  # Method to decrement the comments counter for the associated post
  def decrement_post_comments_counter
    post.decrement!(:comments_counter)
  end
end
