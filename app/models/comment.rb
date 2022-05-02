class Comment < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :post

  def increase_comment_counter
    post = Post.find(post_id)
    post.increment!(:comments_counter)
  end
end
