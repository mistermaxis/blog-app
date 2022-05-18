class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :increase_comment_counter
  after_destroy :decrease_comment_counter

  def increase_comment_counter
    post = Post.find(post_id)
    post.increment!(:comments_counter)
  end

  def decrease_comment_counter
    post = Post.find(post_id)
    post.decrement!(:comments_counter)
  end
end
