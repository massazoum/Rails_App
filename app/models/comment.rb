class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  def self.update_post_comments_counter(post_id)
    post = Post.find_by(id: post_id)
    return unless post

    post.update(comments_counter: post.comments.count)
  end
end
