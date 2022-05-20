require 'rails_helper'
require './spec/integrations/integration_mocks'

RSpec.describe 'Post index view', type: :feature do
  include Mocks
  before :each do
    @users = create_users
    @posts = create_posts(@users)
    @likes, @comments = create_likes_comments(@users, @posts)
    visit new_user_session_path
    within('form') do
      fill_in 'user_email', with: 'john@mail.com'
      fill_in 'user_password', with: 'admin123'
    end
    click_button 'Log in'
    click_link('John')
    click_link('See all posts')
  end

  context 'Elements on page show' do
    it 'User photo is displayed' do
      expect(page).to have_css('img')
    end

    it 'Should display User\'s name' do
      expect(page).to have_content(@users.first.name)
    end

    it 'Should display number of posts by its user' do
      expect(page).to have_content 'Number of posts: 5'
    end

    it 'I can see a post\'s title' do
      post = Post.all.where(author_id: 1)
      post.each do |p|
        expect(page).to have_content p.title
      end
    end

    it 'I can see some of the post\'s body' do
      posts = Post.all.where(author_id: 1)
      posts.each do |p|
        expect(page).to have_content p.title
      end
    end
  end

  context 'Display comments, likes and pagination' do
    it 'I can see some comments on a post' do
      expect(page).to have_content(':')
    end

    it 'How many comments a post has' do
      expect(page).to have_content('Comments:')
    end

    it 'How many likes a post has' do
      expect(page).to have_content('Likes:')
    end
  end

  context 'User interaction of profile' do
    it 'Click on a post and redirect me to its full page' do
      click_link('Post', match: :first)
      expect(page).to have_content 'Write a new comment'
    end
  end
end
