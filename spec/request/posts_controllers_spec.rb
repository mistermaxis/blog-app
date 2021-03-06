require 'rails_helper'

RSpec.describe 'PostsControllers', type: :request do
  describe 'GET /posts_controllers' do
    it 'loads the lists of posts' do
      get user_posts_path(1)
      expect(response).to have_http_status(200)
      expect(response.body).to include 'List of Posts for User'
    end
    it 'loads each individual post' do
      get user_post_path(1, 1)
      expect(response).to have_http_status(200)
      expect(response.body).to include 'Post 1 for User 1'
    end
  end
end
