class Post < ApplicationRecord
 belongs_to :author, class_name: "User", foreign_key: "author_id"
 has_many :comments, dependent: :destroy
 has_many :likes, dependent: :destroy

 def self.update_user_posts_counter(user_id)
   user = User.find_by(id: user_id)
   return unless user

   user.update(posts_counter: user.posts.count)
 end

 def recent_comments(limit = 5)
   comments.order(created_at: :desc).limit(limit)
 end
end
