# spec/factories/user.rb
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    photo { 'https://example.com/fake_image.jpg' }
    post_counter { 0 }
    sequence(:id) { |n| n } # Add a unique ID for each user
  end
end
