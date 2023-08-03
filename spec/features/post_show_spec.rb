require 'rails_helper'

RSpec.describe 'Post Show Page', type: :feature do
  let!(:user) { FactoryBot.create(:user, name: 'John') }
  let!(:post) { FactoryBot.create(:post, author: user) }
  let!(:comment1) { FactoryBot.create(:comment, post: post) }
  let!(:comment2) { FactoryBot.create(:comment, post: post) }
  before do
    puts user_post_path(user, post)
  visit user_post_path(user, post)
  end

  it 'displays the post\'s title' do
    expect(page).to have_content('Test Post')
  end

  it 'displays who wrote the post' do
    expect(page).to have_content('by John')
  end

  it 'displays how many comments it has' do
    expect(page).to have_content('Comments')
  end

  it 'displays the comment each commentor left' do
    expect(page).to have_content('Comment')
    expect(page).to have_content('Comment')
  end
  
  it 'displays how many likes it has' do
    expect(page).to have_button('Like')
  end

  it 'displays the post body' do
    expect(page).to have_content('This is a test post.')
  end

  it 'displays the username of each commentor' do
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.name)
  end

end
