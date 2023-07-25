require 'rails_helper'

RSpec.describe User, type: :model do

  subject { User.new(name: 'Massa Z', post_counter: 0) }

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:post_counter).only_integer.is_greater_than_or_equal_to(0) }

    before(:each) { subject.save }
    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should be invalid when name is not present' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'should be invalid when posts_counter is not a number' do
      subject.post_counter = 'invalid'
      expect(subject).not_to be_valid
    end
  end

  describe '#update_posts_counter' do
  it 'updates the post_counter based on the count of associated posts' do
    user = User.create(name: 'John Doe', post_counter: 0)

    user.posts.create(title: 'Post 1', text: 'Post 1 content', comments_counter: 0, likes_counter: 0)
    user.posts.create(title: 'Post 2', text: 'Post 2 content', comments_counter: 0, likes_counter: 0)
    user.posts.create(title: 'Post 3', text: 'Post 3 content', comments_counter: 0, likes_counter: 0)

    user.update_posts_counter

    user.reload

    expect(user.post_counter).to eq(3) 
  end

  it 'does not update post_counter if there are no associated posts' do
    user = User.create(name: 'Jane Smith', post_counter: 0)

    user.update_posts_counter

    user.reload

    expect(user.post_counter).to eq(0) 
  end
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




