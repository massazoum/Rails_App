require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:text) }
  end

  describe 'update_post_comments_counter' do
    it 'updates the comments counter for a post' do
      post = Post.create(title: 'Test Post', text: 'This is a test post', comments_counter: 0, likes_counter: 0)

      Comment.create(text: 'Comment 1', user: User.create(name: 'Alice'), post: post)
      Comment.create(text: 'Comment 2', user: User.create(name: 'Bob'), post: post)
      Comment.create(text: 'Comment 3', user: User.create(name: 'Charlie'), post: post)

      expect { post.comments.last.destroy }.to change { post.reload.comments_counter }.by(-1)
    end
  end
end
