require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Test', photo: 'photo.jpg', bio: 'Test bio.') }

  before(:each) { subject.save }

  it 'Name must not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero.' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
