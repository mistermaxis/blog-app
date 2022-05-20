require 'user'

module Mocks
  def create_users
    names = [
      { name: 'John', bio: 'I am John', posts_counter: 0, email: 'john@mail.com', role: 'user' },
      { name: 'Jane', bio: 'I am Jane', posts_counter: 0, email: 'jane@mail.com', role: 'user' }
    ]
    (0..1).each do |i|
      user = User.new(names[i])
      user.password = 'admin123'
      user.password_confirmation = 'admin123'
      user.skip_confirmation!
      user.save!
    end
    User.all
  end

  def create_posts(users)
    users.each do |user|
      (1..5).each do |j|
        Post.create(title: "Post number: #{j}", text: "This is post number: #{j}", comments_counter: 0,
                    likes_counter: 0, author_id: user.id)
      end
    end
    Post.all
  end

  def create_likes_comments(users, posts)
    posts.each do |post|
      (0..1).each do |j|
        Like.create(author_id: users[j].id, post_id: post.id)
        Comment.create(author_id: users[j].id, post_id: post.id,
                       text: "I'm #{users[j].name} and I am commenting gibberish here.")
      end
    end
  end
end
