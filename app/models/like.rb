class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_like_counter

  # A method that updates the likes counter for a post.
  def update_like_counter
    post.increment!(:likes_counter)
  end
end
