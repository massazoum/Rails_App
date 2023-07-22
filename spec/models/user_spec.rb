require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:post_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'recent_posts' do
    it 'returns the 3 most recent posts for a user' do
      user = User.create(name: 'John Doe', post_counter: 0)

      posts = [
        user.posts.create(title: 'Post 1', text: 'Post 1 content', comments_counter: 0, likes_counter: 0),
        user.posts.create(title: 'Post 2', text: 'Post 2 content', comments_counter: 0, likes_counter: 0),
        user.posts.create(title: 'Post 3', text: 'Post 3 content', comments_counter: 0, likes_counter: 0),
        user.posts.create(title: 'Post 4', text: 'Post 4 content', comments_counter: 0, likes_counter: 0)
      ]

      recent_posts = user.recent_posts.to_a
      # Ensure the most recent 3 posts are returned
      expect(recent_posts).to eq(posts.last(3).reverse)
    end
  end
end
