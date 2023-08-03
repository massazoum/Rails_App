# spec/factories/posts.rb

# FactoryBot.define do
#   factory :post do
#     title { 'Test Post' }
#     comments_counter { 0 }
#     likes_counter { 0 }
#     text { "This is a test post." }
#   end
# end

FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Test Post #{n}" }
    text { "This is a test post." }
    comments_counter { 0 }
    likes_counter { 0 }
    association :author, factory: :user 
  end
end
