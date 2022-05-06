require 'rails_helper'

RSpec.describe Post, type: :model do
  author = User.new(name: 'Test', photo: 'photo.jpg', bio: 'Test bio.')

  subject { Post.new(author: author, title: 'Test', text: 'Test Post') }

  before(:each) { subject.save }

  it 'Title must not be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must not be longer than 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be an integer greater than or equal to zero.' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'LikesCounter must be an integer greater than or equal to zero.' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
