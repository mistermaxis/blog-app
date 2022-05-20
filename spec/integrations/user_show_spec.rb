require 'rails_helper'
require './spec/integrations/integration_mocks'

RSpec.describe 'user show view', type: :feature do
  include Mocks
  before :each do
    @users = create_users
    @posts = create_posts(@users)
    visit new_user_session_path
    within('form') do
      fill_in 'user_email', with: 'john@mail.com'
      fill_in 'user_password', with: 'admin123'
    end
    click_button 'Log in'
    click_link('John')
  end

  context 'Elements on page show' do
    it 'The user photo is displayed' do
      expect(page).to have_css('img')
    end

    it 'Should display User\'s name' do
      expect(page).to have_content('John')
    end

    it 'Should display number of posts by its user' do
      expect(page).to have_content 'Number of posts: 5'
    end

    it 'Should display user\'s bio' do
      expect(page).to have_content 'I am John'
    end

    it 'Should display user\'s three posts' do
      expect(page).to have_css('.post')
    end

    it 'Should display See all posts button' do
      expect(page).to have_content 'See all posts'
    end
  end

  context 'Redirecting properly to other paths' do
    it "When I click to see all posts, it redirects me to the user's post's index page" do
      click_link('See all posts')
      expect(page).to have_current_path "/users/#{@users[0].id}/posts"
    end
  end
end
