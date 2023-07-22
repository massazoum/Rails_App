require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should belong_to(:post) }
  end

  describe '#update_like_counter' do
    it 'increments the likes_counter of the associated post' do
      post = FactoryBot.create(:post)
      like = Like.create(post: post)

      expect do
        like.update_like_counter
      end.to change { post.reload.likes_counter }.by(1)
    end
  end
end
