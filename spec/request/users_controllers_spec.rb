require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  describe 'GET /users_controllers' do
    it 'loads the list of users' do
      get users_path
      expect(response).to have_http_status(200)
      expect(response.body).to include 'Tom'
    end
    it 'loads each individual user' do
      get user_path(1)
      expect(response).to have_http_status(200)
      expect(response.body).to include 'Teacher from Mexico'
    end
  end
end
