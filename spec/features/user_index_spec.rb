require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'User Index Page', type: :feature do
  # Before each test, create some test users to populate the page
  before do
    # Create some test users (use FactoryBot or any other factory gem)
    FactoryBot.create_list(:user, 5)
    visit users_path
  end

  describe 'Display User Information' do
    it 'displays the username of all other users' do
      User.all.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'displays the profile picture for each user' do
      User.all.each do |user|
        if user.photo.present?
          expect(page).to have_css("img[src*='#{user.photo}']")
        else
          expect(page).to have_css("img[src*='default_avatar.png']")
        end
      end
    end

    it 'displays the number of posts each user has written' do
      User.all.each do |user|
        if user.post_counter == 1
          expect(page).to have_content('(1 post)')
        else
          expect(page).to have_content("Number of posts: #{user.posts.count}")
        end
      end
    end
  end

  describe 'User Navigation' do
    it 'redirects to user show page when clicking on a user' do
      User.all.each do |user|
        puts "Clicking user with ID: #{user.id}, Name: #{user.name}"
  
        click_link(user.name, match: :first)
  
        expect(page).to have_current_path(user_path(user))
        # Add any other expectations you need for the user show page here
        visit users_path # Go back to the user index page for the next iteration
      end
    end
  end
   
end
