require 'rails_helper'

RSpec.describe Like, type: :model do
  author = User.first
  
  post = Post.first

  subject { Like.new(author: author, post: post) } 

  before(:each) { subject.save }

  it 'Like belongs to correct author' do
    expect(subject.author_id).to be(author.id)
  end

  it 'Like belongs to correct post' do
    expect(subject.post_id).to be(post.id)
  end

  it 'Like counter is incremented in the post' do
    incremented = post.likes_counter + 1
    post.increment!(:likes_counter)
    expect(subject.post.likes_counter).to be(incremented)
  end
end
