# spec/models/post_spec.rb
require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'recent_comments' do
    it 'returns the 5 most recent comments for a post' do
      post = Post.create(title: 'Test Post', text: 'This is a test post', comments_counter: 0, likes_counter: 0)

      comments = [
        Comment.create(text: 'Comment 1', user: User.create(name: 'Alice'), post: post),
        Comment.create(text: 'Comment 2', user: User.create(name: 'Bob'), post: post),
        Comment.create(text: 'Comment 3', user: User.create(name: 'Charlie'), post: post),
        Comment.create(text: 'Comment 4', user: User.create(name: 'David'), post: post),
        Comment.create(text: 'Comment 5', user: User.create(name: 'Eve'), post: post),
        Comment.create(text: 'Comment 6', user: User.create(name: 'Frank'), post: post),
        Comment.create(text: 'Comment 7', user: User.create(name: 'Frank'), post: post),
        Comment.create(text: 'Comment 8', user: User.create(name: 'Frank'), post: post)
      ]

      # Convert the ActiveRecord association to an array
      recent_comments = post.recent_comments.to_a

      # Ensure the most recent 5 comments are returned
      expect(recent_comments).to eq(comments.last(5).reverse)
    end
  end
end
