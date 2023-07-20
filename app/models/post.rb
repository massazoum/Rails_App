class Post < ApplicationRecord
 belongs_to :author, class_name: 'User'
 has_many :comments, dependent: :destroy
 has_many :likes, dependent: :destroy

 after_save :update_user_posts_counter
 
 private
 
 def update_user_posts_counter
   post.increment!(:posts_counter)
 end
end