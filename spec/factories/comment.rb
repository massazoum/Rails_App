# spec/factories/comment.rb
FactoryBot.define do
 factory :comment do
   sequence(:text) { |n| "Comment #{n}" }
   association :post
   association :author, factory: :user
 end
end
