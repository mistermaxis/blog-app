require_relative '../../config/environment'

RSpec.describe Comment, type: :model do
  author = User.first
  post = Post.first

  subject { Comment.new(text: 'Test comment', author: author, post: post) }
  
  before(:each) { subject.save }

  it "Comments belong to the correct user" do
    expect(subject.author).to be(author)
  end

  it "Comments belong to the correct post" do
    expect(subject.post).to be(post)
  end
end
