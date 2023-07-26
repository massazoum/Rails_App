# spec/factories/users.rb
FactoryBot.define do
 factory :user do
   # Add any attributes you want to set for the user
   name { "John Doe" }
   post_counter { 0 } 
 end
end

