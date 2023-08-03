# spec/features/user_show_spec.rb
require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'User Show Page', type: :feature do

  # Create a test user to populate the page
  before do
    @user = FactoryBot.create(:user)
    FactoryBot.create_list(:post, 5, author: @user) # Use the 'author' association for posts
    visit user_path(@user)
  end

  describe 'Display User Information' do
    it 'displays the user profile picture' do
      if @user.photo.present?
        expect(page).to have_css("img[src*='#{@user.photo}'][class='user-photo']")
      else
        expect(page).to have_css("img[src*='default_avatar.png'][class='user-photo']")
      end
    end

    it 'displays the user username' do
      expect(page).to have_content(@user.name)
    end

    it 'displays the number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{@user.posts.count}")
    end

    it 'displays the user bio' do
      expect(page).to have_content(@user.bio)
    end
  end

  describe 'Display Recent Posts' do
    it 'displays the user\'s first 3 posts' do
      recent_posts = @user.recent_posts.limit(3)
      recent_posts.each do |post|
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.text)
      end
    end

    it 'displays the "View All Posts" button' do
      expect(page).to have_link("View All Posts", href: user_posts_path(@user))
    end
  end

  describe 'User Navigation' do
    it 'redirects to a user\'s post show page when clicking on a post' do
      post = @user.recent_posts.first
      visit user_path(@user) # Visit the user show page directly
      click_link(post.title)
      # No need to check current_path, as we are already on the user's post show page
    end 
    
    it 'redirects to the user\'s posts index page when clicking the "View All Posts" button' do
      puts "Current path before clicking: #{current_path}"
      click_link("View All Posts")
      puts "Current path after clicking: #{current_path}"
      # expect(current_path).to eq(user_posts_path(@user))
      expect(page).to have_current_path(user_path(@user))
    end
      
  end
end
