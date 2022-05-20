require 'rails_helper'
require './spec/integrations/integration_mocks'

RSpec.describe 'Post show view', type: :feature do
  include Mocks
  before :each do
    @users = create_users
    @posts = create_posts(@users)
    @comments = create_likes_comments(@users, @posts)
    visit new_user_session_path

    within('form') do
      fill_in 'user_email', with: 'john@mail.com'
      fill_in 'user_password', with: 'admin123'
    end
    click_button 'Log in'
    click_link 'John'
    click_link 'See all posts'
    click_link('Post', match: :first)
  end

  context 'Elements on page display' do
    it 'Post title is displayed' do
      expect(page).to have_content('Post')
    end

    it 'Post author is displayed' do
      expect(page).to have_content('John')
    end

    it 'Post comments count is displayed' do
      expect(page).to have_content('Comments: 2')
    end

    it 'Post likes count is displayed' do
      expect(page).to have_content('Likes: 2')
    end

    it 'Post body is displayed' do
      expect(page).to have_content('This is post number')
    end

    it 'Commenter names are displayed' do
      expect(page).to have_content 'John'
      expect(page).to have_content 'Jane'
    end

    it 'Comment text is displayed' do
      expect(page).to have_content 'I am commenting gibberish'
    end
  end
end
