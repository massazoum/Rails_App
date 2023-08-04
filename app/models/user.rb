# app/models/user.rb
class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable ,:confirmable
    # Validations
    validates :name, presence: true
    validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
    attribute :post_counter, :integer, default: 0
    # Associations
    has_many :posts, foreign_key: :author_id, dependent: :destroy
    has_many :likes, foreign_key: :author_id
  
    def recent_posts
      posts.order(created_at: :desc).limit(3)
    end
  
    def update_posts_counter
      update(post_counter: posts.count)
    end
  end