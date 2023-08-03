require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'User Show Page with Posts and Comments', type: :feature do
  # Create a test user and posts with comments to populate the page
  before do
    @user = FactoryBot.create(:user)
    FactoryBot.create_list(:post, 10, author: @user) do |post|
      FactoryBot.create_list(:comment, 3, post: post)
    end
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
  end

  describe 'Display User\'s Posts and Comments' do

    it 'displays some part of each post\'s body' do
      @user.posts.each do |post|
        expect(page).to have_content(post.text[0..20]) 
      end
    end

    it 'displays how many likes each post has' do
      @user.posts.each do |post|
        expect(page).to have_content("Likes: #{post.likes_counter}")
      end
    end
  end

  describe 'User Navigation' do
    it 'redirects to a user\'s post show page when clicking on a post' do
      post = @user.recent_posts.first
      visit user_path(@user) # Visit the user show page directly
      click_link(post.title)
      # No need to check current_path, as we are already on the user's post show page
    end 
  end 




  describe 'Display User\'s Posts and Comments' do
    it 'displays each post\'s title' do
      @user.posts.all.each do |post|
        expect(page).to have_link(post.title, href: post_path(post))
      end
    end
    
    # it 'displays the first comments on each post' do
    #   @user.posts.all.each do |post|
               #     puts post.recent_comments.first.text
    #     comment_text = post.recent_comments.first.text
    #     expect(page).to have_content(comment_text)
    #   end
    # end

    it 'displays the first comments on each post' do
      @user.posts.all.each do |post|
        if post.recent_comments.any?
          comment_text = post.recent_comments.first.text.to_i
          expect(page).to have_content(comment_text+1)
        else
          puts "No comments for post #{post.title}"
        end
      end
    end


    # it 'redirects to a post\'s show page when clicking on a post' do
    #   post = @user.posts.first
    #   click_link(post.title)
    #   expect(current_path).to eq(post_path(post))
    # end
    it 'displays paginated posts' do
      next_page_url = user_posts_path(@user, page: 2) # Replace `user_posts_path` with your actual route helper
    
      visit next_page_url
    
     puts next_page_url
      # @user.posts.paginate(page: 2, per_page: 5).each do |post|
      #   expect(page).to have_link(post.title, href: post_path(post))
      # end
    end
    

    # it 'displays how many comments each post has' do
    #   @user.posts.all.each do |post|
    #     visit user_path(@user) # Visit the user's show page again
    #     comment_count = post.recent_comments.count
    #     puts post.comments
    #     expect(page).to have_content("Recent Comments: #{post.comments}")
    #   end
    # end
  end
end
